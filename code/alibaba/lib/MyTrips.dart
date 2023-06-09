import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';
import 'Widgets/TicketCatalog.dart';


class Trip {
  const Trip ({
    required this.number,
    required this.type,
    required this.dateAndTime,
    required this.price,
    required this.status,
  });

  final String number;
  final String type;
  final String dateAndTime;
  final String price;
  final String status;
  static const String statusFinilized = "نهایی شده";
  static const String statusPending = "در انتظار پرداخت";
  static const String statusDismissed = "لغو شده";
  Icon statusIcon () {
    switch(status) {
      case statusFinilized : {
        return Icon(
          size: 18,
          Icons.task_alt,
          color: Colors.green,
        );
      }
      case statusPending : {
        return Icon(
          size: 18,
          Icons.pending_actions_sharp,
          color: Colors.yellow[800],
          );
      }
      case statusDismissed : {
        return Icon(
          size: 18,
          Icons.remove_circle_outline,
          color: Colors.red,
          );
      }
      default: {
        return Icon(
          size: 18,
          Icons.circle,
          color: Colors.grey,
        );
      }
    }
  }

}


class MyTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    List<String> fields = [ "شماره سفارش", "نوع سفارش", "تاریخ و ساعت", "مبلغ (ریال)", "وضعیت", "" ];
    appState.trips.add(
      Trip(
        number: "۳۴۲۹۳۴۳",
        type: "پرواز داخلی",
        dateAndTime: "۱۴۰۰/۰۱/۲۳ ۲۲:۲۷",
        price: "۵,۴۰۰,۰۰۰",
        status: Trip.statusFinilized,
      )
      );
    appState.trips.add(
      Trip(
        number: "۹۳۷۳۵۴۳",
        type: "پرواز داخلی",
        dateAndTime: "۱۴۰۱/۰۹/۲۱ ۱۸:۰۰",
        price: "۱۰,۳۰۰,۰۰۰",
        status: Trip.statusDismissed,
      )
      );
    appState.trips.add(
      Trip(
        number: "۲۶۵۸۵۳",
        type: "پرواز خارجی",
        dateAndTime: "۱۳۹۹/۱۱/۰۳ ۰۸:۳۰",
        price: "۲۱,۹۸۰,۰۰۰",
        status: Trip.statusPending,
      )
      );
    if (appState.trips.isEmpty){
      return Center(
        child: Text('.سفری در حساب کاربری شما وجود ندارد'),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.lightBlue.shade50),
            columnSpacing: 8,
            border: TableBorder(verticalInside: BorderSide(
              color: Colors.grey,
              width: 0.1,
              
            )),
            columns: [
              DataColumn(label: Center(child: Text(fields[4], textAlign:TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))),
              DataColumn(label: Center(child: Text(fields[3], textAlign:TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))),
              DataColumn(label: Center(child: Text(fields[2], textAlign:TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))),
              DataColumn(label: Center(child: Text(fields[1], textAlign:TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))),
              DataColumn(
                label: Center(child: Text(fields.first, textAlign:TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))
              ),
            ],
            rows: 
            [
                for (var i in appState.trips)
                  DataRow(
                    cells: [
                      DataCell(i.statusIcon()),
                      DataCell(Center(child: Text(i.price, textAlign:TextAlign.center))),
                      DataCell(Center(child: Text(i.dateAndTime, textAlign:TextAlign.center))),
                      DataCell(Center(child: Text(i.type, textAlign:TextAlign.center))),
                      DataCell(Center(child: Text(i.number, textAlign:TextAlign.center))),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}