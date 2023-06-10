import 'package:alibaba/FindPage.dart';
import 'package:alibaba/FlightsPage.dart';
import 'package:alibaba/PassengerInfo.dart';

import 'Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'Account.dart';
import 'FavoritesPage.dart';
import 'MyHomePage.dart';
import 'MyTrips.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'علی‌بابا',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber,
              ),
        ),
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          '/Account/Login': (BuildContext context) => Login(),
          '/Purchase/Flight': (BuildContext context) => FlightsPage(),
          '/Purchase/Flight/Find': (BuildContext context) => FindPage(),
          '/Purchase/Flight/Find/PassengerInfo': (BuildContext context) => PassengerInfo(),
          '/Purchase/Flight/Find/PassengerInfo/Confirm': (BuildContext context) => PassengerInfo(),

        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var backgroundColor = Color.fromARGB(255, 240, 243, 243);
  var columnColor = Color.fromARGB(255, 255, 255, 255);
  var barColor = Color.fromARGB(255, 255, 255, 255);
  var header1Size = 30.0;
  var header2Size = 20.0;
  var header3Size = 16.0;
  var normalSize = 14.0;
  var smallSize = 10.0;
  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
  var trips = <Trip>[];
  
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final linkStyle = theme.textTheme.displayMedium!.copyWith(
      color: Colors.blue,
    );
    return Card(
      elevation: 20,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            pair.asLowerCase,
            style: style,
            semanticsLabel: "${pair.first} ${pair.second}",
          ),
        ),
      ),
    );
  }
}
