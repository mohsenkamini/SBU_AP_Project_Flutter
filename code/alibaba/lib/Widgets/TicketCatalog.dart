import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';

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
      surfaceTintColor: appState.columnColor,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(50)),
                      color: appState.backgroundColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        tag3,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(50)),
                      color: appState.backgroundColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        tag2,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(50)),
                      color: appState.backgroundColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        tag1,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 27,
                          child: ClipOval(
                            child: Image.network(airlineImageUrl),
                          ),
                        ),
                      ),
                    Text(airlineName),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
