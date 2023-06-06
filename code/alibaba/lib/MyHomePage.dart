import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'FavoritesPage.dart';
import 'SignUpPage.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex =0 ;
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
        page = SignUpPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page=GeneratorPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'حساب کاربری',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.luggage_outlined),
              label: 'سفر‌های من',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
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
      }
    );
  }
}


