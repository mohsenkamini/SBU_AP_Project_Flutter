import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: Color.fromARGB(100, 0, 0, 0)
    );

  
    return Column(
      children: [

        SizedBox(height: 100),
        Container(
          child: Text(
            'ثبت نام',
            style: style),
        ),
      ],
    );

  }
}