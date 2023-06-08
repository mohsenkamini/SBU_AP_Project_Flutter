import 'package:alibaba/Account.dart';
import 'package:alibaba/FavoritesPage.dart';
import 'package:alibaba/FindPage.dart';
import 'package:alibaba/InternationalFlights.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:alibaba/screens/utils/Styles.dart';
import 'package:alibaba/DomesticFlights.dart';
import 'FindPage.dart';
import 'FlightsPage.dart';

class InternationalFlights extends StatefulWidget {
  @override
  State<InternationalFlights> createState() => _InternationalFlightsState();
}

class _InternationalFlightsState extends State<InternationalFlights> {
  Color _OneWayColor = Styles.selectedColor;
  Color _TwoWayColor = Styles.notSelectedColor;
  Color _DomesticFlightsColor = Styles.notSelectedColor;
  Color _InternationalFlightsColor = Styles.selectedColor;
  @override
  Widget build(BuildContext context) {
    //pagelayout
    final size = AppLayout.getSize(context);
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
              FittedBox(
                  child: Container(
                padding: const EdgeInsets.all(3.5),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(50),
                            ),
                            color: const Color(0xFF4FF6FD)),
                        child: Row(
                          children: [
                            /*
                  domestic flights
                  */
                            Container(
                              width: size.width * .44,
                              height: size.height * .05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                        AppLayout.getHeight(50)),
                                  ),
                                  color: Styles.notSelectedColor),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DomesticFlights()));
                                  },
                                  child: Text(
                                    "پرواز داخلی",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),

                    /*Intenational Flights */
                    Container(
                      width: size.width * .44,
                      height: size.height * .05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(AppLayout.getHeight(50)),
                          ),
                          color: Styles.selectedColor),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             InternationalFlights()));
                          },
                          child: Text(
                            "پرواز خارجی",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              //End of Flight Buttons
              Gap(AppLayout.getHeight(5)),
              FittedBox(
                  child: Container(
                padding: const EdgeInsets.all(3.5),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(50),
                            ),
                            color: const Color(0xFF4FF6FD)),
                        child: Row(
                          children: [
                            /*
                  Two-Way
                  */
                            Container(
                              width: size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppLayout.getHeight(50)),
                                  color: _TwoWayColor),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _TwoWayColor = Styles.selectedColor;
                                      _OneWayColor = Styles.notSelectedColor;
                                    });
                                    Ticket.isOneWay = false;
                                  },
                                  child: Text(
                                    "رفت و برگشت",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),

                    /*One-Way */
                    Container(
                      width: size.width * .44,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(50)),
                          color: _OneWayColor),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _OneWayColor = Styles.selectedColor;
                              _TwoWayColor = Styles.notSelectedColor;
                            });
                            Ticket.isOneWay = true;
                          },
                          child: Text(
                            "یک طرفه",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              //end of tickets

              //start of Search Button
              Gap(AppLayout.getHeight(370)),
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
                                  child: Container(
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
