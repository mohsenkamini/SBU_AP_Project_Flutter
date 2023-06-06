import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';

class Account extends StatefulWidget {
  
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController emailController = TextEditingController();  

  TextEditingController usernameController = TextEditingController();  

  TextEditingController passwordController = TextEditingController();  
  
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
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
            'ایجاد حساب جدید',
            style: TextStyle(
              fontSize: appState.header2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField (  
              controller: emailController,
              textAlign: TextAlign.right,
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                hintText: 'آدرس ایمیل'  
              ),  
            ),
          ),  
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField ( 
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
              obscureText: _obscureText,  
              decoration: InputDecoration(
                icon: const Icon(Icons.visibility_off),
                border: OutlineInputBorder(),  
                hintText: 'کلمه عبور'  
              ),  
            ),
          ),  
          ElevatedButton(
           onPressed: (){},
           child: Text(
              'ثبت نام',
              style: TextStyle(
                fontSize: appState.header2Size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'قبلا حساب کاربری ایجاد کرده‌اید؟',
                  style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: ' ورود',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/Account/Login');
                    } ),
              ],
            ),
          ),

        ],
      ),
    ),
    );
  }
}
