import 'package:alibaba/Account.dart';
import 'package:alibaba/FavoritesPage.dart';
import 'package:alibaba/FindPage.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:alibaba/screens/utils/Styles.dart';
import 'package:alibaba/DomesticFlights.dart';

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
          body: TabBarView(children: <Widget>[FlightTabs(), FlightTabs()])
          // body: ListView(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: AppLayout.getWidth(20),
          //         vertical: AppLayout.getHeight(20)),
          //     children: [
          //       //Start of Header
          //       Gap(AppLayout.getHeight(20)),
          //       Center(
          //         child: Text(
          //           "پروازها",
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       //End of Header

          //       //Start of Flight buttons
          //       Gap(AppLayout.getHeight(20)),
          //       SizedBox(
          //           child: TabBar(
          //         controller: _tabController,
          //         labelColor: Colors.black,
          //         unselectedLabelColor: Colors.black,
          //         tabs: [
          //           Tab(text: "پروازهای داخلی"),
          //           Tab(text: "پروازهای خارجی"),
          //         ],
          //       )),

          //       SizedBox(
          //         width: 20,
          //         height: AppLayout.getHeight(30),
          //         child: TabBarView(
          //           controller: _tabController,
          //           children: [
          //             SizedBox(
          //                 width: 20,
          //                 height: AppLayout.getHeight(25),
          //                 child: Container(
          //                   child: TabBar(
          //                       controller: _tabController1,
          //                       labelColor: Colors.black,
          //                       unselectedLabelColor: Colors.black,
          //                       tabs: [
          //                         Tab(text: "دو طرفه"),
          //                         Tab(text: "یک طرفه"),
          //                       ]),
          //                 )),
          //             SizedBox(
          //                 width: 20,
          //                 height: AppLayout.getHeight(25),
          //                 child: Container(
          //                   child: TabBar(
          //                       controller: _tabController2,
          //                       labelColor: Colors.black,
          //                       unselectedLabelColor: Colors.black,
          //                       tabs: [
          //                         Tab(text: "دو طرفه"),
          //                         Tab(text: "یک طرفه"),
          //                       ]),
          //                 )),
          //             SizedBox(
          //               width: 20,
          //               height: AppLayout.getHeight(30),
          //               child: TabBarView(
          //                   controller: _tabController2,
          //                   children: [Text("Test1"), Text("Test2")]),
          //             ),
          //             SizedBox(
          //               child:
          //                   TabBarView(controller: _tabController, children: [
          //                 Text(
          //                   "Test1",
          //                   style: TextStyle(fontSize: 30),
          //                 ),
          //                 Text("Test2")
          //               ]),
          //             ),
          //           ],
          //         ),
          //       ),
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

  FlightTabs() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Container(child: Text("دو طرفه")),
                ),
                Tab(child: Container(child: Text("یک طرفه"))),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              color: Colors.amber[600],
            ),
            Container(
              color: Colors.amber[100],
            )
          ])),
    );
  }
}
