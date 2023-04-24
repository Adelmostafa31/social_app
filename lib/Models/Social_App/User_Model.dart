class SocialUserModel{
  String? name;
  String? email;
  String? phone;
  String? userId;
  String? bio;
  String? image;
  String? coverImage;
  bool? isEmailVerified;

  SocialUserModel({
    this.name,
    this.email,
    this.phone,
    this.userId,
    this.bio,
    this.image,
    this.coverImage,
    this.isEmailVerified,
  });

  SocialUserModel.fromjson(Map<String,dynamic>? json){
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    userId = json['userId'];
    bio = json['bio'];
    image = json['image'];
    coverImage = json['coverImage'];
    isEmailVerified = json['isEmailVerified'];
  }
   Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'userId':userId,
      'image':image,
      'bio':bio,
      'coverImage':coverImage,
      'isEmailVerified':isEmailVerified,
    };
  }

}