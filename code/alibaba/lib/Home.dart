import 'package:alibaba/BusPage.dart';
import 'package:alibaba/FlightsPage.dart';
import 'package:alibaba/TrainsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .2,
              child: FloatingActionButton(
                  heroTag: "btnFlights",
                  backgroundColor: Colors.blueGrey[600],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FlightsPage()));
                  },
                  child: Icon(
                    Icons.flight,
                    size: 50,
                  ))),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .2,
              child: FloatingActionButton(
                  heroTag: "btnTrains",
                  backgroundColor: Colors.blueGrey[600],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TrainsPage()));
                  },
                  child: Icon(
                    Icons.train,
                    size: 50,
                  ))),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .2,
              child: FloatingActionButton(
                  heroTag: "btnBuses",
                  backgroundColor: Colors.blueGrey[600],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BusPage()));
                  },
                  child: Icon(
                    Icons.directions_bus_rounded,
                    size: 50,
                  ))),
        ),
        Container(),
        Container(),
      ],
    ));
  }
}
