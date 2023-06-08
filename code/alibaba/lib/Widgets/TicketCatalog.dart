import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';

class TicketCatalog extends StatefulWidget {
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
  State<TicketCatalog> createState() => _TicketCatalogState();
}

class _TicketCatalogState extends State<TicketCatalog> {
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

    var isCapacityFull = (widget.capacity <= widget.booked );
    var emptySeats = widget.capacity - widget.booked;
    return Card(
      elevation: 20,
      surfaceTintColor: appState.columnColor,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      
                      Row(
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
                                    widget.tag3,
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
                                    widget.tag2,
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
                                widget.tag1,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.takeOffTime,
                              style: TextStyle(
                                fontSize: appState.header2Size,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            size: 10,
                            color: Colors.grey,
                          ),
                          Container(
                            height:3.0,
                            width:110.0,
                            color:Colors.grey,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            size: 10,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.landingTime,
                              style: TextStyle(
                                fontSize: appState.header2Size,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 26.1,
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.white,
                                child: Image.network(widget.airlineImageUrl),
                              ),
                            ),
                          ),
                        Text(widget.airlineName),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  isCapacityFull
                  ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 10, 12),
                    child: Text(
                      
                      "تکمیل ظرفیت",
                      style: TextStyle(
                        color: Colors.red,
                        shadows: [
                          Shadow( // bottomLeft
                            offset: Offset(0.02, 0.02),
                            color: Colors.black
                          ),
                        ],
                        fontSize: appState.header3Size,
                        fontWeight: FontWeight.normal,
                      ),
                      ),
                  )
                  : Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 10, 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ریال',
                          style: TextStyle(
                            color: Colors.black,
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(0.02, 0.02),
                                color: Colors.black
                              ),
                            ],
                            fontSize: appState.normalSize,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.price,
                            style: TextStyle(
                              color: Colors.blue,
                              shadows: [
                                Shadow( // bottomLeft
                                  offset: Offset(0.4, 0.4),
                                  color: Colors.blue
                                ),
                              ],
                              fontSize: appState.header2Size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.transparent,  //color of divider
                          width: 100, //width space of divider
                        ),
                        Text(
                          'صندلی باقی مانده ',
                          style: TextStyle(
                            color: Colors.red,
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(0.02, 0.02),
                                color: Colors.black
                              ),
                            ],
                            fontSize: appState.normalSize,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '$emptySeats',
                          style: TextStyle(
                            color: Colors.red,
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(0.02, 0.02),
                                color: Colors.black
                              ),
                            ],
                            fontSize: appState.normalSize,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            ],
          ),
        ),
    );
  }
}
