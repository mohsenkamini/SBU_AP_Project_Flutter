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
    final style = theme.textTheme.displayMedium!.copyWith();

  return Scaffold(
    backgroundColor:  appState.backgroundColor,
    appBar: AppBar(
      backgroundColor: appState.barColor,
      centerTitle: true,
      title: const Text(
        'ثبت نام',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Center(
      child: Text(
        '!به علی‌بابا خوش آمدید',
        style: TextStyle(
          fontSize: appState.header2Size,
          fontWeight: FontWeight.bold,
      ),
    ),),
    );
  }
}
