import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';


class FindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor:  appState.backgroundColor,
    appBar: AppBar(
      backgroundColor: appState.barColor,
      centerTitle: false,

      title: Column(
        children: [
          const Text(
            'بلیط هواپیم تهران به اهواز',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'پنجشنبه ۸ تیر ۱۰ نفر',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),

    ),
    body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Text(
            'بلیط هواپیم تهران به اهواز',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      ),
    ),
    );
  }
}