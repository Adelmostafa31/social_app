
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/Social_App/Social_Login/Social_Login_Cubit/state.dart';

class SocialLoginCubit extends Cubit<SocialLoginState>{
  SocialLoginCubit():super(SocialIntialState());
  static SocialLoginCubit get(context)=> BlocProvider.of(context);


void UserLogin({
  required String email,
  required String password,
}){
  emit(SocialLoadingState());
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
  ).then((value){
    emit(SocialSuccessState(value.user!.uid));
  }).catchError((Error){
    emit(SocialErorrState(Error.toString()));
  });

}

IconData suffix = Icons.visibility;

bool isSecure = true;

void ChangeVisibility(){
  isSecure = !isSecure;

  suffix = isSecure ? Icons.visibility_off : Icons.visibility;
  emit(ChangeSocialVisibilty());
}

}