class CommentModel{
  String? userName;
  String? userId;
  String? ProfileUserimage;
  String? commentDate;
  String commentText = '';
  String? commentImage;
  String? postID;

  CommentModel({
    this.userName,
    this.userId,
    this.ProfileUserimage,
    this.commentDate,
    required this.commentText,
    this.commentImage,
    this.postID
  });

  CommentModel.fromjson(Map<String,dynamic>? json){
    userName = json!['userName'];
    userId = json['userId'];
    ProfileUserimage = json['ProfileUserimage'];
    commentDate = json['commentDate'];
    commentText = json['commentText'];
    commentImage = json['commentImage'];
    postID = json['postID'];
  }
  Map<String,dynamic> toMap(){
    return {
      'userName':userName,
      'userId':userId,
      'ProfileUserimage':ProfileUserimage,
      'commentDate':commentDate,
      'commentImage':commentImage,
      'commentText':commentText,
      'postID':postID,
    };
  }

}