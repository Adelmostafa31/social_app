import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor = Colors.brown,
  double radius = 25 ,
      required String text,
      required OnPressedFunction,
       double fontsize = 25,
}) => Container(
  height: 40,
  width: width,
  child:MaterialButton(
    onPressed: OnPressedFunction,
    child: Text(text.toUpperCase(),
      style: TextStyle(
        fontSize: fontsize,
        color: Colors.white.withOpacity(0.8),
        fontWeight: FontWeight.w900,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: backgroundColor,
  ),
);
///////////////////////////////////
Widget defaultFormField({
  required TextInputType type,
  required String label,
  IconData? prefix ,
  IconData? suffix ,
  required TextEditingController controller ,
  required Validatorfunction,
  suffixPressedFunction,
  bool isScure = false,
  OnTap,
  onChange,
}) => TextFormField(
    controller:controller ,
    keyboardType: type ,
    validator:Validatorfunction ,
    obscureText: isScure,
    onTap:OnTap,
    onChanged: onChange,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefix),
      suffixIcon: IconButton(onPressed: suffixPressedFunction , icon: Icon(suffix),
                    ),
            ),
);
///////////////////////////////////
Widget BuildTaskItem({
  required IconButton Icons,
  required IconButton Icon2,
  required Map model,
  required context,
}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
          '${model['Time']}',
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${model['Title']}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('${model['Date']}',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Icons,
      Icon2,

    ],
  ),
);
//////////////////////////////////////
Widget BuildArticleItem(articles,context)=> InkWell(
  // onTap: (){
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context)=> WebViewScreen(articles['url'])),
  //       );
  // },
  child:   Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('${articles['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${articles['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${articles['publishedAt']}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);
//////////////////////////////////////
Widget myDivide()=> Container(
width: double.infinity,
height: 1,
color: Colors.grey[300],);
/////////////////////////////////////
void ShowToast({
    required String message,
    required ToastStates state,
})=> Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: ChooseToastState(state),
textColor: Colors.white,
fontSize: 16.0
);
enum ToastStates{SUCCESS,ERORR,WARNING}

Color ChooseToastState(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
    break;
    case ToastStates.ERORR:
      color = Colors.red;
    break;
    case ToastStates.WARNING:
      color = Colors.amber;
    break;
  }
  return color;
}

//////////////////////////////////////////





