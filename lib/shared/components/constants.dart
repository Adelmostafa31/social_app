//https://newsapi.org/v2/everything?q=tesla&from=2022-07-28&sortBy=publishedAt&apiKey=API_KEY


//base url: https://newsapi.org/
//method(url): v2/top-headlines
// queres: q=tesla&from=2022-07-28&sortBy=publishedAt&apiKey=API_KEY



//country=us
//category=business
//apiKey=b45ddf9358514eb9854d28a5dffd3879



import 'package:flutter/material.dart';
import 'package:social_app/shared/network/Cach_Helper/cach_helper.dart';

///////////////////////////////////////////////////////////

//?&&



// void SignOut(context){
//   CachHelper.removeData(key:'token').then((value){
//     if(value){
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context)=>Login_Screen())
//         );
//       }
//   });
// }

String? token = '';

String? userId = '';





void printFullText(String? text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text!).forEach((match)=>print(match.group(0)));
}


