import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/Social_App/NewPost/NewPost_Screen.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';

class SocialHomeScreen extends StatelessWidget {
  const SocialHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context,state){
        if(state is SocialAddPostState){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>NewPostScreen())
          );
        }
      },
      builder: (context,state){
        var cubit = SocialCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.notifications_active,size: 30),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search,size: 30),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_sharp),
                label: 'Chat'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline_rounded),
                label: 'Add Post'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_rounded),
                label: 'Users'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                label: 'Settings'
              ),
            ],
            onTap: (index){
              cubit.ChangeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
