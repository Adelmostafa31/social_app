
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/User_Model.dart';
import 'package:social_app/Modules/Social_App/Social_Register/Register_Cubit/states.dart';
import 'package:social_app/shared/components/constants.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState>{
  SocialRegisterCubit():super(SocialRegisterIntialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String Email,
    required String Password,
    required String Name,
    required String Phone,
  }){
    emit(SocialRegisterLodingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password
    ).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
          Email: Email,
          Name: Name,
          Phone: Phone,
          UserId: value.user!.uid
      );
      emit(SocialRegisterSuccessState());
    }).catchError((Erorr){
      print(Erorr.toString());
      emit(SocialRegisterErorrState(Erorr.toString()));
    });
  }
  void userCreate({
    required String Email,
    required String Name,
    required String Phone,
    required String UserId,
}){
    SocialUserModel model =SocialUserModel(
        name : Name,
        email : Email,
        phone : Phone,
        userId: UserId,
        bio: 'Write Your Bio....',
        image: 'https://img.freepik.com/free-photo/headshot-beautiful-carefree-smiling-gorgeous-lady-with-dark-hair-red-lips_273609-44720.jpg?w=996&t=st=1665418323~exp=1665418923~hmac=7869a86e4f385f0b951d8dbf816f11844ba03d12b0f195c8d7667899a113b11d',
        coverImage: 'https://img.freepik.com/free-vector/color-seamless-space-pattern_102902-2360.jpg?w=900&t=st=1665427350~exp=1665427950~hmac=aa65d014a756ccb9165e21a348c7aefc1b4024e04d102fe984736f036950c22d',
        isEmailVerified:false
    );
    print(Email);
     FirebaseFirestore.instance
        .collection('users')
        .doc(UserId)
        .set(model.toMap())
        .then((value){
  emit(SocialCreateUserSuccessState(userId!));
}).catchError((Error){
  print(Error.toString());
  emit(SocialCreateUserErorrState(Error.toString()));
});
  }
  IconData suffix =Icons.visibility;
  bool isSecure = true;
  void SocialChangeVisibilty(){
    isSecure = !isSecure;
    suffix = isSecure ? Icons.visibility_off : Icons.visibility;
    emit(SocialRegisterChangeVisibiltyState());
  }
}