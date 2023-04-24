import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/Social_Cubit/cubit.dart';
import 'package:social_app/shared/Social_Cubit/state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/colors.dart';

class EditProfileScreen extends StatelessWidget {



  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,state){},
      builder: (context,state){
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text = SocialCubit.get(context).model.name!;
        bioController.text = SocialCubit.get(context).model.bio!;
        phoneController.text = SocialCubit.get(context).model.phone! ;
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(
                    onPressed: (){
                      SocialCubit.get(context).updateUserData(
                          Name: nameController.text,
                          Phone: phoneController.text,
                          bio: bioController.text
                      );
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight:Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                          image: coverImage == null
                                              ? NetworkImage(
                                              '${SocialCubit.get(context).model.coverImage}'
                                          )
                                              : FileImage(coverImage) as ImageProvider,
                                          fit: BoxFit.cover
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 19,
                                  backgroundColor: Colors.blue,
                                  child: IconButton(
                                      onPressed: (){
                                        SocialCubit.get(context).getCoverImage();
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 19,
                                        color: Colors.white,
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundImage:profileImage == null
                                    ? NetworkImage(
                                    '${SocialCubit.get(context).model.image}'
                                )
                                    :  FileImage(profileImage) as ImageProvider,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    onPressed: (){
                                      SocialCubit.get(context).getProfileImage();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  if(SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                    Row(
                    children: [
                      if(SocialCubit.get(context).profileImage != null)
                        Container(
                        height: 30,
                        child: Expanded(
                              child: MaterialButton(
                                onPressed: (){
                                  SocialCubit.get(context).uploadProfileImage(
                                      Name: nameController.text,
                                      Phone: phoneController.text,
                                      bio: bioController.text
                                  );
                                },
                                child:Text(
                                  'Upload Profile',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold
                                  ),
                                ) ,
                              ),
                            ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: defualtColor()
                        ),
                      ),
                      SizedBox(width: 15,),
                      if(SocialCubit.get(context).coverImage != null)
                        Container(
                        height: 30,
                        child: Expanded(
                              child: MaterialButton(
                                onPressed: (){
                                  SocialCubit.get(context).uploadCoverImage(
                                      Name: nameController.text,
                                      Phone: phoneController.text,
                                      bio: bioController.text
                                  );
                                },
                                child:Text(
                                  'Upload Cover',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: defualtColor()
                        ),
                      ),
                    ],
                  ),
                  if(SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                    SizedBox(height: 20,),
                  defaultFormField(
                    type: TextInputType.name,
                    label: 'Change Your Name',
                    controller: nameController,
                    Validatorfunction: (String? value){
                      if(value!.isEmpty){
                        return 'This Feild Must Not Be Embty';
                      }
                      return null;
                    },
                    prefix: Icons.person
                  ),
                  SizedBox(height: 10,),
                  defaultFormField(
                      type: TextInputType.text,
                      label: 'Change Your Bio',
                      controller: bioController,
                      Validatorfunction: (String? value){
                        if(value!.isEmpty){
                          return 'This Feild Must Not Be Embty';
                        }
                        return null;
                      },
                      prefix: Icons.info_outline
                  ),
                  SizedBox(height: 10,),
                  defaultFormField(
                      type: TextInputType.phone,
                      label: 'Change Your Phone',
                      controller: phoneController,
                      Validatorfunction: (String? value){
                        if(value!.isEmpty){
                          return 'This Feild Must Not Be Embty';
                        }
                        return null;
                      },
                      prefix: Icons.phone
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
