import 'package:flutter/material.dart';

void main() => runApp(Flight());

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
    return MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  title: Icon(
                    Icons.flight,
                    color: Colors.white,
                    size: 50,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.red[600],
                ),
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Scaffold(
                      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
                      floatingActionButton: Wrap(
                    //will break to another line on overflow
                    direction: Axis.horizontal,
                    //use vertical to show  on vertical axis

                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              child: flightBotton('پرواز خارجی')),
                        ),
                      ), //button first

                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: flightBotton('پرواز داخلی')),
                      ), // button second
                    ],
                  )),
                ))));
  }
}
