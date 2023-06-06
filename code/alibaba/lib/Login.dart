import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Login extends StatelessWidget {  
  TextEditingController emailController = TextEditingController();  
  TextEditingController usernameController = TextEditingController();  
  TextEditingController passwordController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    TextStyle linkStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      );
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
          SizedBox(height: 18,),
          Text(
            '.نام کاربری و کلمه عبور خود را وارد کنید',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: appState.normalSize,
              //fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField ( 
              controller: usernameController, 
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
            padding: const EdgeInsets.all(15.0),
            child: TextField (  
              controller: passwordController,
              textAlign: TextAlign.right,
              obscureText: true,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                hintText: 'کلمه عبور'  
              ),  
            ),
          ),  
          ElevatedButton(
           onPressed: (){},
           child: Text(
              'ورود',
              style: TextStyle(
                fontSize: appState.header2Size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
    ),
    );
  }
}