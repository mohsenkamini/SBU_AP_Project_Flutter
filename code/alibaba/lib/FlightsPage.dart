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
import 'package:alibaba/Details/OriginDomestic.dart';
import 'Details/DestinationDomestic.dart';
import 'Details/DestinationInternational.dart';

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
  String? valueDestinationDomestic;
  String? valueOriginInternational;
  String? valueDestinationInternational;
  String passengersText = "مسافران";
  var buildSize;
  Widget build(BuildContext context) {
    //pagelayout
    final size = AppLayout.getSize(context);
    buildSize = size;
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
          ])),
    );
  }

  DomesticOrigin() {
    var items = OriginDomestic.items;

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(
            item,
          ),
        ));
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
      padding: EdgeInsets.only(top: 2, bottom: 0, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black87, width: 2)),
      child: DropdownButton<String>(
        icon: Icon(Icons.location_on_outlined),
        isExpanded: true,
        hint: Center(
          child: Text(
            "مبدا",
            textAlign: TextAlign.right,
          ),
        ),
        items: items.map(buildMenuItem).toList(),
        value: valueOriginDomestic,
        onChanged: ((value) => setState(() => valueOriginDomestic = value)),
      ),
    );
  }

  DomesticDestination() {
    var items = DestinationDomestic.items;

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(
            item,
          ),
        ));
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
      padding: EdgeInsets.only(top: 2, bottom: 0, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black87, width: 2)),
      child: DropdownButton<String>(
        icon: Icon(Icons.location_on_outlined),
        isExpanded: true,
        hint: Center(
          child: Text(
            "مقصد",
            textAlign: TextAlign.right,
          ),
        ),
        items: items.map(buildMenuItem).toList(),
        value: valueDestinationDomestic,
        onChanged: ((value) =>
            setState(() => valueDestinationDomestic = value)),
      ),
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
                    child: Container(child: Text("رفت و برگشت")),
                  ),
                  Tab(child: Container(child: Text("یک طرفه"))),
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            //Two-Way
            ListView(
              children: [
                Container(
                  child: SizedBox(child: DomesticOrigin()),
                ),
                Container(
                  child: SizedBox(child: DomesticDestination()),
                ),
                Container(
                  child: Passengers(),
                ),
                Container(child: SearchButton()),
              ],
            ),
            //One-Way
            ListView(
              children: [
                Container(
                  child: SizedBox(child: DomesticOrigin()),
                ),
                Container(
                  child: SizedBox(child: DomesticDestination()),
                ),
                Container(child: Calendar()),
                Container(
                  child: Passengers(),
                ),
                Container(child: SearchButton()),
              ],
            ),
          ])),
    );
  }

  InternationalOrigin() {
    var items = OriginDomestic.items;

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ));
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
      padding: EdgeInsets.only(top: 2, bottom: 0, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black87, width: 2)),
      child: DropdownButton<String>(
        icon: Icon(Icons.location_on_outlined),
        isExpanded: true,
        hint: Center(
          child: Text(
            "مبدا",
            textAlign: TextAlign.right,
          ),
        ),
        items: items.map(buildMenuItem).toList(),
        value: valueOriginInternational,
        onChanged: ((value) =>
            setState(() => valueOriginInternational = value)),
      ),
    );
  }

  InternationalDestination() {
    var items = DestinationInternational.items;

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Center(
            child: Text(
              item,
            ),
          ),
        ));
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
      padding: EdgeInsets.only(top: 2, bottom: 0, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black87, width: 2)),
      child: DropdownButton<String>(
        icon: Icon(Icons.location_on_outlined),
        isExpanded: true,
        hint: Center(
          child: Center(
            child: Text(
              "مقصد",
              textAlign: TextAlign.right,
            ),
          ),
        ),
        items: items.map(buildMenuItem).toList(),
        value: valueDestinationInternational,
        onChanged: ((value) =>
            setState(() => valueDestinationInternational = value)),
      ),
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
                    child: Container(child: Text("رفت و برگشت")),
                  ),
                  Tab(child: Container(child: Text("یک طرفه"))),
                ],
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            //Two-Way
            ListView(
              children: [
                Container(
                  child: SizedBox(child: InternationalOrigin()),
                ),
                Container(
                  child: SizedBox(child: InternationalDestination()),
                ),
                Container(child: Calendar()),
                Container(
                  child: Passengers(),
                ),
                Container(child: SearchButton()),
              ],
            ),
            //One-Way
            ListView(
              children: [
                Container(
                  child: SizedBox(child: InternationalOrigin()),
                ),
                Container(
                  child: SizedBox(child: InternationalDestination()),
                ),
                Container(child: Calendar()),
                Container(
                  child: Passengers(),
                ),
                Container(child: SearchButton()),
              ],
            ),
          ])),
    );
  }

  Passengers() {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.only(
            top: 20, right: 20, left: AppLayout.getScreenWidth() * .6),
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black87, width: 2)),
        child: Center(
            child: TextButton(
                onPressed: () {
                  _passengersBottomSheet(context);
                },
                child: Text(passengersText))),
      ),
    );
  }

  SearchButton() {
    return Center(
      child: SizedBox(
          width: buildSize.width * .7,
          child: Center(
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindPage()));
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
    );
  }

  Calendar() {}

  void _passengersBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: MediaQuery.of(context).size.height * .35,
              child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .8,
                          bottom: MediaQuery.of(context).size.height * .3),
                      child: Text(
                        "مسافران",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          // left: MediaQuery.of(context).size.width * .8,
                          bottom: MediaQuery.of(context).size.height * .3),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  " بزرگسال ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  " (دوازده سال به بالا)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ])));
        });
  }
}
