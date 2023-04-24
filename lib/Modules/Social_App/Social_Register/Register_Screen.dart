
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/Social_App/Feeds/Feed_Screen.dart';
import 'package:social_app/Modules/Social_App/Social_Register/Register_Cubit/cubit.dart';
import 'package:social_app/Modules/Social_App/Social_Register/Register_Cubit/states.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/Cach_Helper/cach_helper.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialRegisterScreen extends StatelessWidget {

  bool Boolean = false ;
  var EmailController = TextEditingController();
  var NameController = TextEditingController();
  var PasswordController = TextEditingController();
  var PhoneController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterState>(
        listener: (context,state){
         if(state is SocialCreateUserSuccessState){
           CachHelper.saveData(
               value:state.Uid ,
               key: 'userId'
           ).then((value){
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context)=>SocialFeedScreen())
             );
           });
         }
         if(state is SocialCreateUserErorrState){
           ShowToast(message: state.Erorr, state: ToastStates.ERORR);
         }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
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
                            type: TextInputType.name,
                            label: 'Name',
                            controller: NameController,
                            Validatorfunction: (String? value){
                              if(value!.isEmpty){
                                return 'This Feild Must Not Be Embty';
                              }
                              return null;
                            },
                            prefix: Icons.person
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            type: TextInputType.phone,
                            label: 'Phone',
                            controller: PhoneController,
                            Validatorfunction: (String? value){
                              if(value!.isEmpty){
                                return 'This Feild Must Not Be Embty';
                              }
                              return null;
                            },
                            prefix: Icons.phone_android
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            type: TextInputType.emailAddress,
                            label: 'Email',
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
                                SocialRegisterCubit.get(context).userRegister(
                                  Email: EmailController.text,
                                  Password: PasswordController.text,
                                  Name: NameController.text,
                                  Phone: PhoneController.text,
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
                            suffix: SocialRegisterCubit.get(context).suffix,
                            isScure: SocialRegisterCubit.get(context).isSecure,
                            suffixPressedFunction: (){
                              SocialRegisterCubit.get(context).SocialChangeVisibilty();
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        state is! SocialRegisterLodingState
                            ? defaultButton(
                            radius: 15,
                            text: 'Register',
                            OnPressedFunction:(){
                              if(FormKey.currentState!.validate()){
                                SocialRegisterCubit.get(context).userRegister(
                                  Email: EmailController.text,
                                  Password: PasswordController.text,
                                  Name: NameController.text,
                                  Phone: PhoneController.text,
                                );
                              }
                            },
                            backgroundColor: defualtColor(),
                            fontsize: 25
                        )
                            :Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text('Don\'t Have An Email..!Register Now',
                        //       style: TextStyle(
                        //           fontSize: 14
                        //       ),
                        //     ),
                        //     TextButton(
                        //         onPressed: (){
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (context)=>RegisterScreen()
                        //             ),
                        //           );
                        //         },
                        //         child: Text('Register')
                        //     )
                        //   ],
                        // )
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
