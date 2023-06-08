import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// void main() => runApp(Flight());

Widget flightBotton(String name) {
  return FloatingActionButton(
    backgroundColor: Colors.red[400],
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
    onPressed: () {
//action code for button 1
    },
    child: Text(name),
  );
}

class Flight extends StatelessWidget {
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  left:
                                      Radius.circular(AppLayout.getHeight(50)),
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
            ))
          ],
        ));
  }
}
