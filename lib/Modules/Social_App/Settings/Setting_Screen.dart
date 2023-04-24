
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/Post_Model.dart';
import 'package:social_app/Modules/Social_App/Comment_Screen/Comment_Screen.dart';
import 'package:social_app/Modules/Social_App/Edit_Profile/EditProfile_Screen.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialSettingScreen extends StatelessWidget {
  const SocialSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context , state){},
      builder: (context , state){
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight:Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${SocialCubit.get(context).model.coverImage}'
                                        ),
                                        fit: BoxFit.cover
                                    )
                                )
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                  '${SocialCubit.get(context).model.image}'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${SocialCubit.get(context).model.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '${SocialCubit.get(context).model.bio}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '100',
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Posts',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25',
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Image',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '746',
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Followers',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1240',
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Reacts',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '521',
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Freinds',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                      vertical :10.0
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                child: MaterialButton(
                                  onPressed: (){},
                                  child:Text(
                                    'Add Photos',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ) ,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: defualtColor()
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 30,
                                child: MaterialButton(
                                  onPressed: (){},
                                  child:Text(
                                    'Find Freinds',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ) ,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: defualtColor()
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical : 10.0
                                    ),
                                    child: Container(
                                      height: 40,
                                      child: MaterialButton(
                                        onPressed: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context)=>EditProfileScreen()
                                              )
                                          );
                                        },
                                        child:Text(
                                          'Edit Profile',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white.withOpacity(0.9),
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: defualtColor()
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Your Posts',
                  style:TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=> buildSocialItem(SocialCubit.get(context).posts[index],context,index),
                  separatorBuilder:(context,index)=> SizedBox(height: 15,),
                  itemCount: SocialCubit.get(context).posts.length
              ),
            ],
          ),
        );
      },
    );
  }
  Widget buildSocialItem(PostModel model , context,index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage:NetworkImage(
                        '${SocialCubit.get(context).model.image}')
                ),
                SizedBox(width: 14,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      ),
                      Text('${model.date}',
                          style: Theme.of(context).textTheme.caption
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14,),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      size: 25,
                    )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[350],
              ),
            ),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.subtitle1 ,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom :10.0,
                  top: 5
              ),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8.0),
                      child: Container(
                        height: 20,
                        child: MaterialButton(
                            onPressed: (){},
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#software',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: defualtColor()
                              ),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8.0),
                      child: Container(
                        height: 20,
                        child: MaterialButton(
                            onPressed: (){},
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#flutter',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: defualtColor()
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if(model.postImage != '')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              '${model.postImage}',
                            ),
                            fit: BoxFit.cover
                        )
                    )
                ),
              ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.red.withOpacity(0.6),
                          ),
                          SizedBox(width: 3,),
                          Text(
                            '${SocialCubit.get(context).postLikeCount[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: Colors.amber.withOpacity(0.8),
                          ),
                          SizedBox(width: 3,),
                          Text(
                            '${SocialCubit.get(context).comment.length} Comment',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[350],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).model.image}',
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Write A Comment.....',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Comment_Screen())
                      );
                    },
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.red.withOpacity(0.6),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){
                    SocialCubit.get(context).PostsLike(SocialCubit.get(context).postsId[index]);
                  },
                ),
                SizedBox(width: 25,),
                InkWell(
                  child: Row(
                    children: [
                      Icon(
                        Icons.ios_share_rounded,
                        color: Colors.green.withOpacity(0.6),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Share',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ],
            )
          ],
        ),
      )
  );
}
