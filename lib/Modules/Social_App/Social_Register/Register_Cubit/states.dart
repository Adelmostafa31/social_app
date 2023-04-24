abstract class SocialRegisterState{}

class SocialRegisterIntialState extends SocialRegisterState{}

class SocialRegisterLodingState extends SocialRegisterState{}

class SocialRegisterSuccessState extends SocialRegisterState{}

class SocialRegisterErorrState extends SocialRegisterState{
  final String Erorr ;
  SocialRegisterErorrState(this.Erorr);
}

class SocialCreateUserSuccessState extends SocialRegisterState{
  final String Uid;

  SocialCreateUserSuccessState(this.Uid);

}

class SocialCreateUserErorrState extends SocialRegisterState{
  final String Erorr ;
  SocialCreateUserErorrState(this.Erorr);
}

class SocialRegisterChangeVisibiltyState extends SocialRegisterState{}

