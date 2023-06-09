import 'package:alibaba/Account.dart';
import 'package:alibaba/Details/OriginDomestic.dart';
import 'package:alibaba/FavoritesPage.dart';
import 'package:alibaba/FindPage.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:alibaba/screens/utils/Styles.dart';
import 'package:alibaba/DomesticFlights.dart';
import 'package:alibaba/Details/OriginDomestic.dart';
import 'InternationalFlights.dart';

class FlightsPage extends StatefulWidget {
  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class Ticket {
  static bool isOneWay = true;

  bool getIsOneWay() {
    return isOneWay;
  }

  void setIsOneWay(bool b) {
    isOneWay = b;
  }
}

class _FlightsPageState extends State<FlightsPage>
    with TickerProviderStateMixin {
  @override
  String? valueOriginDomestic;
  Widget build(BuildContext context) {
    //pagelayout
    final size = AppLayout.getSize(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 240, 243, 243),
            title: Center(child: Text("پروازها")),
            bottom: TabBar(tabs: <Widget>[
              Tab(child: Container(child: Text("پرواز داخلی"))),
              Tab(
                child: Container(child: Text("پرواز خارجی")),
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            FlightTabsDomestic(),
            FlightTabsInternational()
          ])
          //       Gap(AppLayout.getHeight(300)),
          //       FittedBox(
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Center(
          //                 child: Container(
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(
          //                         AppLayout.getHeight(50),
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Center(
          //                           child: SizedBox(
          //                               width: size.width * .7,
          //                               child: Center(
          //                                 child: SizedBox(
          //                                   child: ElevatedButton(
          //                                     onPressed: () {
          //                                       Navigator.push(
          //                                           context,
          //                                           MaterialPageRoute(
          //                                               builder: (context) =>
          //                                                   FindPage()));
          //                                     },
          //                                     child: Text(
          //                                       'جست و جو',
          //                                       style: TextStyle(
          //                                         fontSize: 20,
          //                                         fontWeight: FontWeight.bold,
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               )),
          //                         ),
          //                       ],
          //                     )),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       //End of Search Button
          //     ])),

          ),
    );
  }

  DomesticOrigin() {
    var items = OriginDomestic.items;

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ));
    return DropdownButton<String>(
      isExpanded: true,
      items: items.map(buildMenuItem).toList(),
      value: valueOriginDomestic,
      onChanged: ((value) => setState(() => valueOriginDomestic = value)),
    );
  }

  FlightTabsDomestic() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Transform(
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            ),
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Container(child: Text("دو طرفه")),
                  ),
                  Tab(child: Container(child: Text("یک طرفه"))),
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            //Two-Way
            Container(color: Colors.amber[300], child: DomesticOrigin()),
            //One-Way
            Container(
              color: Colors.amber[200],
            )
          ])),
    );
  }

  FlightTabsInternational() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Transform(
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            ),
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Container(child: Text("دو طرفه")),
                  ),
                  Tab(child: Container(child: Text("یک طرفه"))),
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            //Two-Way
            Container(color: Colors.amber[300]),
            //One-Way
            Container(
              color: Colors.amber[200],
            )
          ])),
    );
  }
}
