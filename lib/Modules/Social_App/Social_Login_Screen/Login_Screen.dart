
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/Social_App/Feeds/Feed_Screen.dart';
import 'package:social_app/Modules/Social_App/Social_Login/Social_Login_Cubit/cubit.dart';
import 'package:social_app/Modules/Social_App/Social_Login/Social_Login_Cubit/state.dart';
import 'package:social_app/Modules/Social_App/Social_Register/Register_Screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/Cach_Helper/cach_helper.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialLoginScreen extends StatelessWidget {

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginState>(
        listener: (context,state){
          if(state is SocialErorrState){
            ShowToast(message: state.Erorr, state: ToastStates.ERORR);
          }
          if(state is SocialSuccessState){
            CachHelper.saveData(
                value:state.Uid ,
                key: 'userId'
            ).then((value){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>SocialFeedScreen())
              );
            });
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Login Page'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue,
                  statusBarIconBrightness: Brightness.light
              ),
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
              titleTextStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w900
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key:FormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultFormField(
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            controller: EmailController,
                            Validatorfunction: (String? value){
                              if(value!.isEmpty){
                                return 'This Feild Must Not Be Embty';
                              }
                              return null;
                            },
                            prefix: Icons.email_outlined
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            controller: PasswordController,
                            onChange: (value){
                              if(FormKey.currentState!.validate()){
                                SocialLoginCubit.get(context).UserLogin(
                                  email: EmailController.text,
                                  password: PasswordController.text,
                                );
                              }
                            } ,
                            Validatorfunction: (String? value){
                              if(value!.isEmpty){
                                return 'This Feild Must Not Be Embty';
                              }
                              return null;
                            },
                            prefix: Icons.lock,
                            suffix: SocialLoginCubit.get(context).suffix,
                            isScure: SocialLoginCubit.get(context).isSecure,
                            suffixPressedFunction: (){
                              SocialLoginCubit.get(context).ChangeVisibility();
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        state is! SocialLoadingState
                            ? defaultButton(
                            radius: 15,
                            text: 'Login',
                            OnPressedFunction:(){
                              if(FormKey.currentState!.validate()){
                                SocialLoginCubit.get(context).UserLogin(
                                  email: EmailController.text,
                                  password: PasswordController.text,
                                );
                              }
                            },
                            backgroundColor: defualtColor(),
                            fontsize: 25
                        ):CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t Have An Email..!Register Now',
                              style: TextStyle(
                                  fontSize: 14
                              ),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>SocialRegisterScreen()
                                    ),
                                  );
                                },
                                child: Text('Register')
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
