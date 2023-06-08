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
    TabController _tabController = TabController(length: 2, vsync: this);
    TabController _tabController1 = TabController(length: 2, vsync: this);
    TabController _tabController2 = TabController(length: 2, vsync: this);
    TabController _tabController3 = TabController(length: 2, vsync: this);
    TabController _tabController4 = TabController(length: 2, vsync: this);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 243, 243),
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(20),
                vertical: AppLayout.getHeight(20)),
            children: [
              //Start of Header
              Gap(AppLayout.getHeight(20)),
              Center(
                child: Text(
                  "پروازها",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //End of Header

              //Start of Flight buttons
              Gap(AppLayout.getHeight(20)),
              SizedBox(
                  child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "پروازهای داخلی"),
                  Tab(text: "پروازهای خارجی"),
                ],
              )),

              SizedBox(
                width: 20,
                height: AppLayout.getHeight(30),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SizedBox(
                        width: 20,
                        height: AppLayout.getHeight(25),
                        child: Container(
                          child: TabBar(
                              controller: _tabController1,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: "دو طرفه"),
                                Tab(text: "یک طرفه"),
                              ]),
                        )),
                    SizedBox(
                        width: 20,
                        height: AppLayout.getHeight(25),
                        child: Container(
                          child: TabBar(
                              controller: _tabController2,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: "دو طرفه"),
                                Tab(text: "یک طرفه"),
                              ]),
                        )),
                    SizedBox(
                      child: TabBarView(
                          controller: _tabController2,
                          children: [Text("Test1"), Text("Test2")]),
                    ),
                    SizedBox(
                      child: TabBarView(
                          controller: _tabController,
                          children: [Text("Test1"), Text("Test2")]),
                    ),
                  ],
                ),
              )

              // FittedBox(
              //     child: Container(
              //   padding: const EdgeInsets.all(3.5),
              //   child: Row(
              //     children: [
              //       Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(
              //                 AppLayout.getHeight(50),
              //               ),
              //               color: const Color(0xFF4FF6FD)),
              //           child: Row(
              //             children: [
              //               /*
              //     domestic flights
              //     */
              //               Container(
              //                 width: size.width * .44,
              //                 height: size.height * .05,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.horizontal(
              //                       left: Radius.circular(
              //                           AppLayout.getHeight(50)),
              //                     ),
              //                     color: Colors.white),
              //                 child: Center(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) =>
              //                                   DomesticFlights()));
              //                     },
              //                     child: Text(
              //                       "پرواز داخلی",
              //                       style: TextStyle(color: Colors.black),
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           )),

              //       /*Intenational Flights */
              //       Container(
              //         width: size.width * .44,
              //         height: size.height * .05,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.horizontal(
              //               right: Radius.circular(AppLayout.getHeight(50)),
              //             ),
              //             color: Colors.white),
              //         child: Center(
              //           child: GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           InternationalFlights()));
              //             },
              //             child: Text(
              //               "پرواز خارجی",
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )),
              // //End of Flight Buttons
              // Gap(AppLayout.getHeight(5)),
              // FittedBox(
              //     child: Container(
              //   padding: const EdgeInsets.all(3.5),
              //   child: Row(
              //     children: [
              //       Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(
              //                 AppLayout.getHeight(50),
              //               ),
              //               color: const Color(0xFF4FF6FD)),
              //           child: Row(
              //             children: [
              //               /*
              //     Two-Way
              //     */
              //               Container(
              //                 width: size.width * .44,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(
              //                         AppLayout.getHeight(50)),
              //                     color: Colors.white),
              //                 child: Center(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       Ticket.isOneWay = false;
              //                     },
              //                     child: Text(
              //                       "رفت و برگشت",
              //                       style: TextStyle(color: Colors.black),
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           )),

              //       /*One-Way */
              //       Container(
              //         width: size.width * .44,
              //         decoration: BoxDecoration(
              //             borderRadius:
              //                 BorderRadius.circular(AppLayout.getHeight(50)),
              //             color: Colors.white),
              //         child: Center(
              //           child: GestureDetector(
              //             onTap: () {
              //               Ticket.isOneWay = true;
              //             },
              //             child: Text(
              //               "یک طرفه",
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )),
              // //end of tickets

              //start of Search Button
              ,
              Gap(AppLayout.getHeight(300)),
              FittedBox(
                child: Center(
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppLayout.getHeight(50),
                              ),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: SizedBox(
                                      width: size.width * .7,
                                      child: Center(
                                        child: SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FindPage()));
                                            },
                                            child: Text(
                                              'جست و جو',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              //End of Search Button
            ]));
  }
}
