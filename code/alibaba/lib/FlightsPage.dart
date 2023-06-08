import 'package:alibaba/FindPage.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:alibaba/screens/utils/Styles.dart';

class FlightsPage extends StatefulWidget {
  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  // const Flight({Key? key}) : super(key: key);
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
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "پرواز داخلی",
                                  style: TextStyle(color: Colors.black),
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
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "پرواز خارجی",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              )),
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
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "رفت و برگشت",
                                  style: TextStyle(color: Colors.black),
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
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "یک طرفه",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              //end of tickets

              //start of search button
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
                                            // recognizer: TapGestureRecognizer()
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
            ]));
  }
}
