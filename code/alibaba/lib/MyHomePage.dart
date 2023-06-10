import 'package:alibaba/Details/LoginCheck.dart';
import 'package:alibaba/Home.dart';
import 'package:alibaba/Profile.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'FlightsPage.dart';
import 'main.dart';
import 'FavoritesPage.dart';
import 'Account.dart';
import 'FindPage.dart';
import 'MyTrips.dart';
import 'PassengerInfo.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 2;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Widget page;
    switch (selectedIndex) {
      case 0:
        if (Logged.isLoggedIn) {
          page = Profile();
        } else {
          page = Account();
        }
        break;
      case 1:
        //page = MyTrips();
        page = PassengerInfo();
        break;
      case 2:
        page = Home();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_sharp),
              label: 'حساب کاربری',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.luggage_outlined),
              activeIcon: Icon(Icons.luggage_sharp),
              label: 'سفر‌های من',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_sharp),
              label: 'خانه',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                //color: Theme.of(context).colorScheme.background,
                color: appState.backgroundColor,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
