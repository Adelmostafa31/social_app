
abstract class SocialLoginState {}

class SocialIntialState extends SocialLoginState{}

class SocialLoadingState extends SocialLoginState{}

class ChangeSocialVisibilty extends SocialLoginState{}

class SocialSuccessState extends SocialLoginState{
  final String Uid;
  SocialSuccessState(this.Uid);
}

class SocialErorrState extends SocialLoginState{
  final String Erorr;
  SocialErorrState(this.Erorr);
}



