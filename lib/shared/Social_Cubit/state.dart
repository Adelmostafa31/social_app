abstract class SocialState{}

class SocialIntialState extends SocialState {}

class SocialGetUserLoadingState extends SocialState {}

class SocialGetUserSuccessState extends SocialState {}

class SocialGetUserErorrState extends SocialState {
  final String Erorr;
  SocialGetUserErorrState(this.Erorr);
}

class SocialChangeBottomNavState extends SocialState{}

class SocialAddPostState extends SocialState{}

class SocialProfileImageSuccessState extends SocialState{}

class SocialProfileImageErrorState extends SocialState{}

class SocialCoverImageSuccessState extends SocialState{}

class SocialCoverImageErrorState extends SocialState{}

class UploadProfileSuccessState extends SocialState{}

class UploadProfileErrorState1 extends SocialState{
  final String Erorr;
  UploadProfileErrorState1(this.Erorr);
}

class UploadProfileErrorState2 extends SocialState{
  final String Erorr;
  UploadProfileErrorState2(this.Erorr);
}

class UploadCoverSuccessState extends SocialState{}

class UploadCoverErrorState1 extends SocialState{
  final String Erorr;
  UploadCoverErrorState1(this.Erorr);
}

class UploadCoverErrorState2 extends SocialState{
  final String Erorr;
  UploadCoverErrorState2(this.Erorr);
}

class SocialUserUpdateErrorState extends SocialState{
  final String Erorr;
  SocialUserUpdateErrorState(this.Erorr);
}

class SocialUserUpdateLoadingState extends SocialState{}

//create post
class SocialCreatePostErrorState extends SocialState{
  final String Erorr;
  SocialCreatePostErrorState(this.Erorr);
}

class SocialCreatePostSuccessState extends SocialState{}

class SocialCreatePostLoadingState extends SocialState{}

class SocialPostImageSuccessState extends SocialState{}

class SocialPostImageErrorState extends SocialState{}

class UploadPostImageSuccessState extends SocialState{}

class UploadPostImageErrorState1 extends SocialState{
  final String Erorr;
  UploadPostImageErrorState1(this.Erorr);
}

class UploadPostImageErrorState2 extends SocialState{
  final String Erorr;
  UploadPostImageErrorState2(this.Erorr);
}

class RemovePostImageState extends SocialState{}

// get posts
class SocialGetPostsLoadingState extends SocialState {}

class SocialGetPostsSuccessState extends SocialState {}

class SocialGetPostsErorrState extends SocialState{
  final String Erorr;
  SocialGetPostsErorrState(this.Erorr);
}
// posts like
class SocialGetPostsLikeSuccessState extends SocialState {}

class SocialGetPostsLikeErorrState extends SocialState{
  final String Erorr;
  SocialGetPostsLikeErorrState(this.Erorr);
}
// create comment
class SocialCreateCommentLoadingState extends SocialState{}

class SocialCreateCommentSuccessState extends SocialState{}

class SocialCreateCommentErrorState extends SocialState{
  final String Erorr;
  SocialCreateCommentErrorState(this.Erorr);
}

class SocialCommentImageSuccessState extends SocialState{}

class SocialCommentImageErrorState extends SocialState{}

class UploadCommentImageSuccessState extends SocialState{}

class UploadCommentImageErrorState1 extends SocialState{
  final String Erorr;
  UploadCommentImageErrorState1(this.Erorr);
}

class UploadCommentImageErrorState2 extends SocialState{
  final String Erorr;
  UploadCommentImageErrorState2(this.Erorr);
}

class RemoveCommentImageState extends SocialState{}
// get comment
class SocialGetCommentLoadingState extends SocialState {}

class SocialGetCommentSuccessState extends SocialState {}

class SocialGetCommentErorrState extends SocialState{
  final String Erorr;
  SocialGetCommentErorrState(this.Erorr);
}

// get all users
class SocialGetAllUserLoadingState extends SocialState{}

class SocialGetAllUserSuccessState extends SocialState{}

class SocialGetAllUserErrorState extends SocialState{}

// chat
class SocialSendMessageSuccessState extends SocialState{}

class SocialSendMessageErrorState extends SocialState{}

class SocialGetMessageSuccessState extends SocialState{}

class SocialGetMessageErrorState extends SocialState{}