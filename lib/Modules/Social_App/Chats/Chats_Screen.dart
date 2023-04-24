
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/User_Model.dart';
import 'package:social_app/Modules/Social_App/Chat_Details/Chat_Details.Screen.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialChatsScreen extends StatelessWidget {
  const SocialChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,state){},
      builder: (context,state){
        return SocialCubit.get(context).users.length > 0
            ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) => buildChatItem(SocialCubit.get(context).users[index],context),
            separatorBuilder:(context,index) => myDivide(),
            itemCount: SocialCubit.get(context).users.length
        )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
  Widget buildChatItem(SocialUserModel model , context) => InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>ChatDetailsScreen(model))
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundImage:NetworkImage(
                  '${model.image}')
          ),
          SizedBox(width: 14,),
          Text('${model.name}',
            style: TextStyle(
                fontSize: 21,
                color: Colors.black.withOpacity(0.85)
            ),
          ),
          SizedBox(width: 4,),
          Icon(
            Icons.check_circle,
            size: 18,
            color: defualtColor(),
          ),
          Spacer(),
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.more_horiz_rounded,
                size: 25,
              )
          )
        ],
      ),
    ),
  );
}
