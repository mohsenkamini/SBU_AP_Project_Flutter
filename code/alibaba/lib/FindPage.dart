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
      centerTitle: true,

      title: Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Text(
      
              textAlign: TextAlign.right,
              'بلیط هواپیما تهران به اهواز',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              textAlign: TextAlign.right,
              'پنجشنبه ۸ تیر ۱۰ نفر',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: appState.header3Size,
              ),
            ),
          ],
        ),
      ),

    ),
    body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              Container(
                color: appState.columnColor,
                height: 60,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'ی - ۰۴/۰۴ تکمیل',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: appState.header3Size,
                    ),
                  ),
                ),
              ),Container(
                color: appState.columnColor,
                height: 60,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'ی - ۰۴/۰۴ تکمیل',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: appState.header3Size,
                    ),
                  ),
                ),
              ),Container(
                color: appState.columnColor,
                height: 60,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'ی - ۰۴/۰۴ ۱,۲۰۷',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: appState.header3Size,
                    ),
                  ),
                ),
              ),Container(
                color: appState.columnColor,
                height: 60,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'ی - ۰۴/۰۴ تکمیل',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: appState.header3Size,
                    ),
                  ),
                ),
              ),Container(
                color: appState.columnColor,
                height: 60,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'ی - ۰۴/۰۴ ۱,۲۰۷',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: appState.header3Size,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}