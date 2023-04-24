class ChatModel{
  String? senderId;
  String? receiverId;
  String? message;
  String? dateTime;

  ChatModel({
    this.dateTime,
    this.message,
    this.receiverId,
    this.senderId,
});
  ChatModel.fromjson(Map<String,dynamic> json){
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    message = json['message'];
    dateTime = json['dateTime'];
  }

  Map<String,dynamic> toMap(){
    return {
      'dateTime':dateTime,
      'message':message,
      'senderId':senderId,
      'receiverId':receiverId,
    };
  }
}