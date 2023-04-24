
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/Chat_Model.dart';
import 'package:social_app/Models/Social_App/User_Model.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {

  SocialUserModel? userModel ;
  var messageController = TextEditingController();
  var now = DateTime.now();
  ChatDetailsScreen(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).getMessage(receiverId: userModel!.userId!);
        return BlocConsumer<SocialCubit,SocialState>(
          listener: (context , state){},
          builder: (context , state){
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 90,
                titleSpacing: 0,
                leading: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 29,
                      backgroundImage: NetworkImage(
                          '${userModel!.image}'
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '${userModel!.name}',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )
                  ],
                ),
              ),
              body: SocialCubit.get(context).message.length > 0
                  ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                          itemBuilder: (context , index){
                            var message = SocialCubit.get(context).message[index];
                            if(userId == message.senderId){
                              return buildMyMessage(message);
                            }else{
                              return buildSenderMessage(message);
                            }
                          },
                          separatorBuilder: (context , index )=> SizedBox(height: 15,),
                          itemCount: SocialCubit.get(context).message.length
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.7),
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type Your Message Here....'
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color:defualtColor(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: MaterialButton(
                              minWidth: 1,
                              onPressed: (){
                                SocialCubit.get(context).sendMessage(
                                    receiverId: userModel!.userId!,
                                    dateTime: now.toString(),
                                    message: messageController.text
                                );
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
                  : Center(child: CircularProgressIndicator())
            );
          },
        );
      },
    );
  }
  Widget buildSenderMessage(ChatModel model)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.7),
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          '${model.message}',
          style: TextStyle(
              fontSize: 22,
              color: Colors.black.withOpacity(0.7)
          ),
        )
    ),
  );
  Widget buildMyMessage(ChatModel model)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.7),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          '${model.message}',
          style: TextStyle(
              fontSize: 22,
              color: Colors.black.withOpacity(0.7)
          ),
        )
    ),
  );
}
