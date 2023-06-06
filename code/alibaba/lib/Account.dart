import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith();

  return Scaffold(
    backgroundColor:  appState.backgroundColor,
    appBar: AppBar(
      backgroundColor: appState.barColor,
      centerTitle: true,
      title: const Text(
        'حساب کاربری',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            'ثبت نام',
            style: TextStyle(
              fontSize: appState.header2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField (  
              textAlign: TextAlign.right,
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                hintText: 'آدرس ایمیل'  
              ),  
            ),
          ),  
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField (  
              textAlign: TextAlign.right,
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                //labelText: 'نام کاربری',  
                hintText: 'نام کاربری'  
              ),  
            ),
          ),  
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField (  
              textAlign: TextAlign.right,
              obscureText: true,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                hintText: 'کلمه عبور'  
              ),  
            ),
          ),  
        ],
      ),
    ),
    );
  }
}
