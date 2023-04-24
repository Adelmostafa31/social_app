
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Social_App/Post_Model.dart';
import 'package:social_app/Modules/Social_App/Comment_Screen/Comment_Screen.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialFeedScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,state){},
      builder: (context,state){
        return SocialCubit.get(context).posts.length > 0 && SocialCubit.get(context).model != null
            ? SingleChildScrollView(
             physics: BouncingScrollPhysics(),
             scrollDirection: Axis.vertical,
             child: Column(
              children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 15,
                margin: EdgeInsets.all(8),
                child:Stack(
                  alignment: Alignment.bottomRight,
                  children:[
                    Image(
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996&t=st=1665271906~exp=1665272506~hmac=be28e5b0c9248da896af82a5a8dea0c80d2b2f2bf027db14fa629f21f3f021e5',
                      ),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Comunicate With Frieds',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.white.withOpacity(0.85)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=> buildSocialItem(SocialCubit.get(context).posts[index],context,index,index),
                  separatorBuilder:(context,index)=> SizedBox(height: 15,),
                  itemCount: SocialCubit.get(context).posts.length
              ),
              SizedBox(height: 10,),
            ],
          ),
        )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
  Widget buildSocialItem(PostModel model , context,int IndexLike,int IndexComment)=> Card(
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
                            '${SocialCubit.get(context).postLikeCount[IndexLike]}',
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
                    SocialCubit.get(context).PostsLike(SocialCubit.get(context).postsId[IndexLike]);
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
