class PostModel{
  String? name;
  String? userId;
  String? image;
  String? date;
  String? text;
  String? postImage;

  PostModel({
    this.name,
    this.userId,
    this.image,
    this.date,
    this.text,
    this.postImage
  });

  PostModel.fromjson(Map<String,dynamic>? json){
    name = json!['name'];
    userId = json['userId'];
    image = json['image'];
    date = json['date'];
    text = json['text'];
    postImage = json['postImage'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'userId':userId,
      'image':image,
      'date':date,
      'postImage':postImage,
      'text':text,
    };
  }

}