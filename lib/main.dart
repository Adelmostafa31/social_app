import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/Social_App/Feeds/Feed_Screen.dart';
import 'package:social_app/Modules/Social_App/Social_Login_Screen/Login_Screen.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'shared/bloc_observer.dart';
import 'shared/components/constants.dart';
import 'shared/network/Cach_Helper/cach_helper.dart';
import 'shared/styles/themes/ThemeData.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CachHelper.init();

  userId = CachHelper.getData(key:'userId');

  Widget widget;
  if(userId != null){
    widget = SocialFeedScreen();
  }else{
    widget = SocialLoginScreen();
  }


  runApp(MyApp(
    startWidget : widget,

  ));
}

class MyApp extends StatelessWidget {

  final Widget startWidget;
  MyApp({
    required this.startWidget,

  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SocialCubit(),
      child: BlocConsumer<SocialCubit,SocialState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme,
            darkTheme:darkTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}