import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';
import 'Widgets/TicketCatalog.dart';

class PassengerInfo extends StatefulWidget {
  @override
  State<PassengerInfo> createState() => _PassengerInfoState();
}

class _PassengerInfoState extends State<PassengerInfo> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedIndex = 4;
  void onDestinationSelected(int index) {
    setState(() {
      if (selectedIndex == index || selectedIndex == index-1 )
        return;
      
      selectedIndex = index;
      switch (selectedIndex) {
      case 0:
      case 1:
        break;
      case 2:
      case 3:
        Navigator.pushNamed(context, '/Purchase/Flight/Find/PassengerInfo/Confirm');
        break;
      case 4:
      case 5:
        Navigator.pushNamed(context, '/Purchase/Flight/Find/PassengerInfo');
        break;
      case 6:
        Navigator.pushNamed(context, '/Purchase/Flight/Find');
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    });
  }
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
            width: 500,
            height: 70,
            child: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              backgroundColor: Colors.transparent,
              destinations: [
              NavigationDestination(selectedIcon: Icon(Icons.payment_sharp,color: Colors.green,) ,icon: Icon(Icons.payment,color: Colors.grey,), label: 'پرداخت'),//selected Index=0
              NavigationDestination(icon: Icon(Icons.navigate_before,color: Colors.grey,), label: ''),//selected Index=1
              NavigationDestination(icon: selectedIndex<=2?Icon(Icons.list_alt_rounded,color: Colors.green,):Icon(Icons.list_alt,color:Colors.grey,), label: 'تایید اطلاعات'),//selected Index=2
              NavigationDestination(icon: Icon(Icons.navigate_before,color: Colors.grey,), label: ''),//selected Index=3
              NavigationDestination(icon: selectedIndex<=4?Icon(Icons.people,color: Colors.green,):Icon(Icons.people_outline,color:Colors.grey,), label: 'مسافران'),//selected Index=4
              NavigationDestination(icon: Icon(Icons.navigate_before,color: Colors.grey,), label: ''),//selected Index=5
              NavigationDestination(icon: Icon(Icons.check_circle, color: Colors.green,), label: 'اطلاعات پرواز'),//selected Index=6
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
                 touchEnable: false,
               ),
               
            ),
        ],
      ),
    ),
    );
  }
}