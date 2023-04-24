import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;
import 'package:social_app/Models/Social_App/Chat_Model.dart';
import 'package:social_app/Models/Social_App/Comment_Model.dart';
import 'package:social_app/Models/Social_App/Post_Model.dart';
import 'package:social_app/Models/Social_App/User_Model.dart';
import 'package:social_app/Modules/Social_App/Chats/Chats_Screen.dart';
import 'package:social_app/Modules/Social_App/Feeds/Feed_Screen.dart';
import 'package:social_app/Modules/Social_App/NewPost/NewPost_Screen.dart';
import 'package:social_app/Modules/Social_App/Settings/Setting_Screen.dart';
import 'package:social_app/Modules/Social_App/Users/Users_Screen.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/components/constants.dart';
class SocialCubit extends Cubit<SocialState>{
  SocialCubit() :super(SocialIntialState());
 static SocialCubit get(context)=>BlocProvider.of(context);
 late SocialUserModel model ;
 late PostModel postModel;


 void getUserData(){
   emit(SocialGetUserLoadingState());

  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .get()
      .then((value){
        print(value.data());
        model = SocialUserModel.fromjson(value.data());
        print(userId);
        emit(SocialGetUserSuccessState());
  }).catchError((Error){
    print(Error.toString());
    emit(SocialGetUserErorrState(Error.toString()));
  });
 }

 int currentIndex = 0;

 List<Widget> screens = [
   SocialFeedScreen(),
   SocialChatsScreen(),
   NewPostScreen(),
   SocialUserScreen(),
   SocialSettingScreen()
 ];

 List<String> titles = [
   'News Feed',
   'Chats',
   'Add Post',
   'Users',
   'Settings',
 ];

 void ChangeBottomNav(int Index){
   if(Index == 1 ){
     getAllUsers();
   }
   if(Index == 2 ){
     emit(SocialAddPostState());
   }else{
     currentIndex = Index;
     emit(SocialChangeBottomNavState());
   }
 }

  File? profileImage;
  var profilePicker = ImagePicker();
  Future<void> getProfileImage() async
  {
    final pickerFile = await profilePicker.getImage(
        source: ImageSource.gallery
    );

    if(pickerFile != null){
      profileImage = File(pickerFile.path);
      emit(SocialProfileImageSuccessState());
    }else{
      print('No Image Selected');
      emit(SocialProfileImageErrorState());
    }
  }

  File? coverImage;
  var coverPicker = ImagePicker();
  Future<void> getCoverImage() async
  {
    
    final pickerFile = await coverPicker.getImage(
        source: ImageSource.gallery
    );

    if(coverPicker != null){
      coverImage = File(pickerFile!.path);
      emit(SocialProfileImageSuccessState());
    }else{
      print('No Image Selected');
      emit(SocialProfileImageErrorState());
    }
  }
  void uploadProfileImage({
    required String Name,
    required String Phone,
    required String bio,
}){
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value){
          value.ref.getDownloadURL().then((value){
            // emit(UploadProfileSuccessState());
            updateUserData(
              Name: Name,
              Phone: Phone,
              bio: bio,
              profile: value
            );
          }).catchError((Error){
            print(Error.toString());
            emit(UploadProfileErrorState1(Error.toString()));
          });
     }).catchError((Error){
      print(Error.toString());
      emit(UploadProfileErrorState2(Error.toString()));
     });
}

  void uploadCoverImage({
    required String Name,
    required String Phone,
    required String bio,
  }){
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value){
          value.ref.getDownloadURL().then((value){
            // emit(UploadCoverSuccessState());
            updateUserData(
                Name: Name,
                Phone: Phone,
                bio: bio,
                cover: value
            );
          }).catchError((Error){
            print(Error.toString());
            emit(UploadCoverErrorState1(Error.toString()));
          });
     }).catchError((Error){
      print(Error.toString());
      emit(UploadCoverErrorState2(Error.toString()));
     });
}

  void updateUserData({
    required String Name,
    required String Phone,
    required String bio,
    String? profile,
    String? cover,
}){
    SocialUserModel uplodModel =SocialUserModel(
        name : Name,
        phone : Phone,
        email: model.email,
        coverImage:cover?? model.coverImage,
        userId: userId,
        image: profile?? model.image,
        bio: bio,
        isEmailVerified:false
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(uplodModel.toMap()).then((value){
      getUserData();
    }).catchError((Error){
      print(Error.toString());
      emit(SocialUserUpdateErrorState(Error.toString()));
    });
  }

  File? postImage;
  var postImagePicker = ImagePicker();
  Future<void> getPostImage() async
  {
    final pickerFile = await postImagePicker.getImage(
        source: ImageSource.gallery
    );
    if(postImagePicker != null){
      postImage = File(pickerFile!.path);
      emit(SocialPostImageSuccessState());
    }else{
      print('No Image Selected');
      emit(SocialPostImageErrorState());
    }
  }

  void uploadPostImage({
    required String date,
    required String text,
  }){
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value){
      value.ref.getDownloadURL().then((value){
        // emit(UploadCoverSuccessState());
        createPost(
          text: text,
          date: date,
          postImage: value,
        );
      }).catchError((Error){
        print(Error.toString());
        emit(SocialCreatePostErrorState(Error.toString()));
      });
    }).catchError((Error){
      print(Error.toString());
      emit(SocialCreatePostErrorState(Error.toString()));
    });
  }

  void createPost({
    required String date,
    required String text,
    String? postImage,
  }){
    emit(SocialCreatePostLoadingState());
    PostModel creatPostModel =PostModel(
      image: model.image,
      userId: userId,
      name: model.name,
      date: date,
      postImage: postImage??'',
      text: text,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(creatPostModel.toMap()).then((value){
          emit(SocialCreatePostSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(SocialCreatePostErrorState(Error.toString()));
    });
  }


  CommentModel? commentModel;

  void removePostImage(){
    postImage= null ;
    emit(RemovePostImageState());
  }

  List<PostModel> posts = [];
  List<int> postLikeCount = [];
  List<String> postsId = [];

  void getPosts(){
    emit(SocialGetPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value){
          value.docs.forEach((postID){
            postID.reference
            .collection('likes')
            .get()
            .then((value){
              postsId.add(postID.id);
              posts.add(PostModel.fromjson(postID.data()));
              postLikeCount.add(value.docs.length);
            })
            .catchError((onError){});
            emit(SocialGetPostsSuccessState());
          });
    })
        .catchError((Erorr){
          emit(SocialGetPostsErorrState(Erorr.toString()));
    });
  }

  void PostsLike(String? postsId){

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postsId)
        .collection('likes')
        .doc(userId)
        .set({
      'Like':true
    })
        .then((value){
          emit(SocialGetPostsLikeSuccessState());
    })
        .catchError((Erorr){
          emit(SocialGetPostsLikeErorrState(Erorr.toString()));
    });
  }

  List<String> commentId = [];
  List<int> postCommentCount = [];
  List<CommentModel> comment = [];

  void createComment({
  required String commentDate,
  required String commentText,
  String? commentImage,
  String? POID,
}){
    CommentModel createCommentModel = CommentModel(
      userId: userId,
      commentDate: commentDate,
      commentImage: commentImage??'',
      commentText: commentText,
      ProfileUserimage: model.image,
      userName: model.name,
      postID: POID
    );
    emit(SocialCreateCommentLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value){
          value.docs.forEach((postID) {
            FirebaseFirestore.instance
            .collection('posts')
            .doc(postID.id)
            .collection('comment')
            .add(createCommentModel.toMap())
                .then((value){
              print(postID.id);
              emit(SocialCreateCommentSuccessState());
            })
                .catchError((Error){
              print(Error.toString());
              emit(SocialCreatePostErrorState(Error.toString()));
            });
          });
    });
  }


  File? commentImage;
  var commentImagePicker = ImagePicker();
  Future<void> getCommentImage() async
  {
    final pickerFile = await commentImagePicker.getImage(
        source: ImageSource.gallery
    );
    if(commentImagePicker != null){
      commentImage = File(pickerFile!.path);
      emit(SocialPostImageSuccessState());
    }else{
      print('No Image Selected');
      emit(SocialPostImageErrorState());
    }
  }

  void uploadCommentImage({
    required String commentDate,
    required String commentText,
}){
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('comment/${Uri.file(commentImage!.path).pathSegments.last}')
        .putFile(commentImage!)
        .then((value){
          value
              .ref
              .getDownloadURL().then((value){
            createComment(
              commentText: commentText,
              commentDate: commentDate,
              commentImage:value
            );
          }).catchError((onError){
            print(onError.toString());
            emit(UploadCommentImageErrorState1(onError));
          });
          // emit(UploadCommentImageSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(UploadCommentImageErrorState2(onError));
    });
  }

  void removeCommentImage(){
    commentImage= null ;
    emit(RemoveCommentImageState());
  }

  List<CommentModel> comments = [];

  void getComment(){
    emit(SocialGetCommentLoadingState());
    FirebaseFirestore.instance
    .collection('posts')
    .get()
    .then((value){
      value.docs.forEach((postIdInPostscCollection) {
        FirebaseFirestore.instance
            .collection('posts')
            .doc(postIdInPostscCollection.id)
            .collection('comment')
            .get()
            .then((value){
              value.docs.forEach((commentIdCommentCollectoin) {
                commentId.add(commentIdCommentCollectoin.id);
                postCommentCount.add(value.docs.length);
                comment.add(CommentModel.fromjson(commentIdCommentCollectoin.data()));
              });
        });

      });
      emit(SocialGetCommentSuccessState());
    }).catchError((onError){
     print(onError.toString());
     emit(SocialGetCommentErorrState(onError.toString()));
    });
  }

  List<SocialUserModel> users = [];

  void getAllUsers(){
    emit(SocialGetAllUserLoadingState());
    if(users.length == 0)
      FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value){
          value.docs.forEach((element) {
            if(element.data()['userId'] != userId)
              users.add(SocialUserModel.fromjson(element.data()));
          });
          emit(SocialGetAllUserSuccessState());
    }).catchError((onError){
      emit(SocialGetAllUserErrorState());
    });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String message,
}){
    ChatModel chatModel = ChatModel(
      dateTime: dateTime,
      message: message,
      receiverId: receiverId,
      senderId:userId ,
    );
    FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('chat')
    .doc(receiverId)
    .collection('message')
    .add(chatModel.toMap())
    .then((value){
      emit(SocialSendMessageSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(SocialSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chat')
        .doc(userId)
        .collection('message')
        .add(chatModel.toMap())
        .then((value){
      emit(SocialSendMessageSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(SocialSendMessageErrorState());
    });
  }

  ChatModel? chatModel;

  List<ChatModel> message = [];

  void getMessage({required String receiverId}){
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chat')
        .doc(receiverId)
        .collection('message')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
          message = [];
          event.docs.forEach((element) {
            message.add(ChatModel.fromjson(element.data()));
          });
        emit(SocialGetMessageSuccessState());
        });
  }
}