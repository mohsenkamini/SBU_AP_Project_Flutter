import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:alibaba/main.dart';

class TicketCatalog extends StatelessWidget {
  const TicketCatalog({
    super.key,
    required this.airlineName,
    required this.airlineImageUrl,
    required this.tag1,
    required this.tag2,
    required this.tag3,
    required this.takeOffTime,
    required this.landingTime,
    required this.price,
    required this.booked,
    required this.capacity,
  });

  final String airlineName;
  final String airlineImageUrl;
  final String tag1;
  final String tag2;
  final String tag3;
  final String takeOffTime;
  final String landingTime;
  final String price;
  final int booked; // number of people bought this ticket
  final int capacity;

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final linkStyle = theme.textTheme.displayMedium!.copyWith(
      color: Colors.blue,
    );
    return Card(
      elevation: 20,
      color: appState.columnColor,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
    );
  }
}
