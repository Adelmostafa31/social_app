

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/Comment_Model.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/components/components.dart';

class Comment_Screen extends StatelessWidget {

  var commentController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (contex,state){},
      builder: (contex,state){
        return Scaffold(
        appBar: AppBar(
          title: Text('Comments'),
        ),
        body:
        // SocialCubit.get(context).commentModel == null || SocialCubit.get(context).commentModel != null
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage('${SocialCubit.get(context).model.image}'),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 35,
                          child: TextFormField(
                            controller: commentController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Write Your Comment....'),
                                border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: (){},
                                child: Text(
                                  'Replay',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue.withOpacity(0.8)
                                  ),
                                )
                            ),
                            SizedBox(width: 15,),
                            TextButton(
                                onPressed: (){},
                                child: Row(
                                  children: [
                                    Text(
                                      'Like',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Colors.red.withOpacity(0.7)
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Icon(
                                      Icons.favorite_border_rounded,
                                      size:20 ,
                                      color: Colors.red.withOpacity(0.7),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(width: 15,),
                            TextButton(
                             onPressed: (){
                            SocialCubit.get(context).createComment(
                                commentDate: now.toString(),
                                commentText: commentController.text
                                 );
                              },
                               child: Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 18,
                                color:Colors.green.withOpacity(0.8)
                            ),
                          )
                      )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
              myDivide(),
              if(SocialCubit.get(context).comment.length > 0)
                Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>buildCommentItem(SocialCubit.get(context).comment[index],context),
                    separatorBuilder: (context,index)=> myDivide(),
                    itemCount: SocialCubit.get(context).comment.length
                ),
              )
              else
                Center(child: CircularProgressIndicator())
          ],
        )

        );
      },
    );
  }
  Widget buildCommentItem(CommentModel model,context)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('${SocialCubit.get(context).model.image}'),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 15,
                    child: Text('${model.commentText}')
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            'Replay',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.withOpacity(0.8)
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Text(
                                'Like',
                                style: TextStyle(
                                    fontSize: 18,
                                    color:Colors.red.withOpacity(0.7)
                                ),
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                Icons.favorite_border_rounded,
                                size:20 ,
                                color: Colors.red.withOpacity(0.7),
                              ),
                            ],
                          )
                      ),
                      SizedBox(width: 15,),

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ],
  );


}
