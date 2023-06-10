import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';
import 'Widgets/TicketCatalog.dart';

class PassengerInfo extends StatelessWidget {
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
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: NavigationBar(destinations: [
              NavigationDestination(icon: Icon(Icons.temple_buddhist), label: 'test'),
              NavigationDestination(icon: Icon(Icons.temple_buddhist), label: 'test2'),
              NavigationDestination(icon: Icon(Icons.temple_buddhist), label: 'test3'),
            ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
               TicketCatalog(
                 airlineName: "ایران ایر",
                 airlineImageUrl: "https://baradfreight.com/wp-content/uploads/2021/11/iran-air-150x150.webp",
                 tag1: "سیستمی", 
                 tag2: "اکونومی", 
                 tag3: "Fokker ۱۰۰", 
                 takeOffTime: "۰۶:۱۰", 
                 landingTime: "۰۷:۳۰", 
                 price: "۱۲,۰۷۰,۰۰۰", 
                 booked: 34, 
                 capacity: 200,
               ),
               
            ),
        ],
      ),
    ),
    );
  }
}