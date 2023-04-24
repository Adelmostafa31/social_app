


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('Create Post'),
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    if(SocialCubit.get(context).postImage == null){
                      SocialCubit.get(context).createPost(
                          date: now.toString(),
                          text: textController.text
                      );
                    }else{
                      SocialCubit.get(context).uploadPostImage(
                          date: now.toString(),
                          text: textController.text
                      );
                    }
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(
                        fontSize: 23
                    ),
                  )
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(height: 5,),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage:NetworkImage(
                            '${SocialCubit.get(context).model.image}')
                    ),
                    SizedBox(width: 14,),
                    Expanded(
                        child: Row(
                          children: [
                            Text('${SocialCubit.get(context).model.name}',
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
                            )
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'What Is In Your Mind,',
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:FileImage(SocialCubit.get(context).postImage!),
                                  fit: BoxFit.cover
                              )
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            onPressed: (){
                              SocialCubit.get(context).removePostImage();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 19,
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        child: MaterialButton(
                          onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          },
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.photo_size_select_actual_outlined,
                                color: Colors.white,
                              )
                            ],
                          )
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: defualtColor()
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        height: 40,
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text(
                            '# Tags',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: defualtColor()
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
