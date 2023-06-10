import 'package:alibaba/Account.dart';
import 'package:alibaba/Details/OriginDomestic.dart';
import 'package:alibaba/FavoritesPage.dart';
import 'package:alibaba/FindPage.dart';
import 'package:alibaba/main.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';
import 'package:counter/counter.dart';
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
  DateTime date = DateTime(2023, 10, 6);
  static String selectedCity = "";
  DateTime? dateDeparture = DateTime(2023, 10, 6);
  DateTime? dateReturn = DateTime(2023, 10, 6);
  static final allCityItemsInter = [
    'شهر پرواز خارجی ۱',
    'شهر پرواز خارجی ۲',
    'شهر پرواز خارجی ۳',
    'شهر پرواز خارجی ۴',
  ];
  static List<String> originCitiesInter = [
    'شهر پرواز خارجی ۱',
    'شهر پرواز خارجی ۲',
    'شهر پرواز خارجی ۳',
    'شهر پرواز خارجی ۴',
  ];
  static var destinationCitiesInter = [
    'شهر پرواز خارجی ۱',
    'شهر پرواز خارجی ۲',
    'شهر پرواز خارجی ۳',
    'شهر پرواز خارجی ۴',
  ];
  static final allCityItems = [
    'شهر پرواز داخلی ۱',
    'شهر پرواز داخلی ۲',
    'شهر پرواز داخلی ۳',
    '۴ شهر پرواز داخلی ',
  ];
  static List<String> originCities = [
    'شهر پرواز داخلی ۱',
    'شهر پرواز داخلی ۲',
    'شهر پرواز داخلی ۳',
    '۴ شهر پرواز داخلی ',
  ];
  static var destinationCities = [
    'شهر پرواز داخلی ۱',
    'شهر پرواز داخلی ۲',
    'شهر پرواز داخلی ۳',
    '۴ شهر پرواز داخلی ',
  ];
  List<String> availableCities(List<String> host, List<String> c, String s) {
    c = host.sublist(0, host.length);
    c.remove(s);
    if (c != null) return c;
    return [];
  }

  int _adult = 1;
  int _child = 0;
  int _infant = 0;
  @override
  String? valueOriginDomestic;
  String? valueDestinationDomestic;
  String? valueOriginInternational;
  String? valueDestinationInternational;
  String passengersText = "مسافران";
  String calendarTextDeparture = "تاریخ رفت";
  String calendarTextReturn = "تاریخ برگشت";

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
    var items = originCities;

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
        onChanged: ((value) => setState(() {
              valueOriginDomestic = value;
              selectedCity = valueOriginDomestic!;
              destinationCities = availableCities(
                  allCityItems, destinationCities, selectedCity);
            })),
      ),
    );
  }

  DomesticDestination() {
    var items = destinationCities;

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
        onChanged: ((value) => setState(() {
              valueDestinationDomestic = value;
              selectedCity = valueDestinationDomestic!;
              originCities =
                  availableCities(allCityItems, originCities, selectedCity);
            })),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                            child: CalendarReturn(
                                MediaQuery.of(context).size.width * .45))),
                    Container(
                        child: CalendarDeparture(
                            MediaQuery.of(context).size.width * .45)),
                  ],
                ),
                Center(
                  child: Container(
                    child: Passengers(),
                  ),
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
                Container(
                    child: CalendarDeparture(
                        MediaQuery.of(context).size.width * .9)),
                Center(
                  child: Container(
                    child: Passengers(),
                  ),
                ),
                Container(child: SearchButton()),
              ],
            ),
          ])),
    );
  }

  InternationalOrigin() {
    var items = originCitiesInter;

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
        value: valueOriginInternational,
        onChanged: ((value) => setState(() {
              valueOriginInternational = value;
              selectedCity = valueOriginInternational!;
              destinationCitiesInter = availableCities(
                  allCityItemsInter, destinationCitiesInter, selectedCity);
            })),
      ),
    );
  }

  InternationalDestination() {
    var items = destinationCitiesInter;

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
        onChanged: ((value) => setState(() {
              valueDestinationInternational = value;
              selectedCity = valueDestinationInternational!;
              originCitiesInter = availableCities(
                  allCityItemsInter, originCitiesInter, selectedCity);
            })),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                            child: CalendarReturn(
                                MediaQuery.of(context).size.width * .45))),
                    Container(
                        child: CalendarDeparture(
                            MediaQuery.of(context).size.width * .45)),
                  ],
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
                  child: SizedBox(child: InternationalOrigin()),
                ),
                Container(
                  child: SizedBox(child: InternationalDestination()),
                ),
                Container(
                    child: CalendarDeparture(
                        MediaQuery.of(context).size.width * .9)),
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
    return Center(
      child: SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          margin: EdgeInsets.only(top: 20),
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
      ),
    );
  }

  SearchButton() {
    return Center(
      child: SizedBox(
          width: buildSize.width * .7,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindPage()));
                },
                child: Text(
                  'جستجو',
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

  CalendarDeparture(double a) {
    return SizedBox(
      width: a,
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black87, width: 2)),
        child: Center(
            child: TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2023, 10, 6),
                    lastDate: DateTime(2025),
                  );
                  if (newDate == null) {
                    setState(() {
                      calendarTextDeparture = "تاریخ رفت";
                    });
                  } else {
                    setState(() {
                      dateDeparture = newDate;
                      calendarTextDeparture =
                          "تاریخ رفت :${dateDeparture!.year}/${dateDeparture!.month}/${dateDeparture!.day}";
                      date = newDate!;
                    });
                  }
                },
                child: Text(calendarTextDeparture))),
      ),
    );
  }

  CalendarReturn(double a) {
    return SizedBox(
      width: a,
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black87, width: 2)),
        child: Center(
            child: TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2023, 10, 6),
                    lastDate: DateTime(2025),
                  );
                  if (newDate == null) {
                    setState(() {
                      calendarTextReturn = "تاریخ برگشت";
                    });
                  } else {
                    setState(() {
                      dateReturn = newDate;
                      calendarTextReturn =
                          "تاریخ برگشت :${dateReturn!.year}/${dateReturn!.month}/${dateReturn!.day}";
                    });
                  }
                },
                child: Text(calendarTextReturn))),
      ),
    );
  }

  void _passengersBottomSheet(context) {
    int _adult = 1;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Scaffold(
              body: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            height: MediaQuery.of(context).size.height * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(children: [
                              Container(
                                margin: EdgeInsets.only(top: 7, bottom: 7),
                                decoration: BoxDecoration(),
                                child: Text(
                                  "مسافران",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ])),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    child: Counter(
                                        min: 1,
                                        max: 20,
                                        step: 1,
                                        onValueChanged: ((value) =>
                                            _adult = value.toInt())),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7, bottom: 7),
                                    child: Text(
                                      "(دوازده سال به بالا) ",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "  بزرگسال",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ]))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                child: Counter(
                                    min: 0,
                                    max: 20,
                                    step: 1,
                                    onValueChanged: ((value) =>
                                        _child = value.toInt())),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7, bottom: 7),
                                child: Text(
                                  "(دو تا دوازده سال) ",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "  کودک",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ]))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    child: Counter(
                                        min: 0,
                                        max: 20,
                                        step: 1,
                                        onValueChanged: ((value) =>
                                            _infant = value.toInt())),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7, bottom: 7),
                                    child: Text(
                                      "(ده روز تا دو سال) ",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "  نوزاد",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.amber[800],
                        onPressed: () {
                          setState(() {
                            passengersText =
                                (_adult + _child + _infant).toString() +
                                    " : " +
                                    "تعداد مسافران ";
                          });

                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.done),
                        label: Text('تایید'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ));
        });
  }

  void addPassendgerAdult() {
    setState(() {
      _adult = _adult + 1;
    });
  }

  void removePassendgerAdult() {
    setState(() {
      _adult = _adult - 1;
    });
  }
}
