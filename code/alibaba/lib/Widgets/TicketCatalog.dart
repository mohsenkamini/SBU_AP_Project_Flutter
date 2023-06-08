import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class TicketCatalog extends StatelessWidget {
  const TicketCatalog({
    super.key,
    required this.airlineName,
    required this.airlineUrl,
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
  final String airlineUrl;
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
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final linkStyle = theme.textTheme.displayMedium!.copyWith(
      color: Colors.blue,
    );
    return Card(
      elevation: 20,
      color: ,
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
