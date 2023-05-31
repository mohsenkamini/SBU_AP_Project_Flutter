import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty){
      return Center(
        child: Text('No favorites yer.'),
      );
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites ' ),
        ),
        
        for (var i in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(i.asLowerCase),
          ),
          
        
        
        

      ],
    );
  }
}
