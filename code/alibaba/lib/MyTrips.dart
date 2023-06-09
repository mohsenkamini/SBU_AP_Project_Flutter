import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';
import 'Widgets/TicketCatalog.dart';
import 'package:alibaba/screens/utils/App_Layout.dart';


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
    
    TextEditingController tripNumberController = TextEditingController();  
    TextEditingController dateFromController = TextEditingController();  
    TextEditingController dateToController = TextEditingController();  

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
        type: "قطار",
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
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'جستجو سفارش',
                        style: TextStyle(
                          color: Colors.amber,
                          shadows: [
                            Shadow( // bottomLeft
                              offset: Offset(0.02, 0.02),
                              color: Colors.black
                            ),
                          ],
                          fontSize: appState.header2Size,
                          fontWeight: FontWeight.bold,
                        ),),
                      Icon(Icons.search,
                      color: Colors.amber,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '.برای جستجو در لیست سفر‌های من پر کردن حداقل یک فیلد کافیست',
                        style: TextStyle(
                          color: Colors.black,
                          shadows: [
                            Shadow( // bottomLeft
                              offset: Offset(0.02, 0.02),
                              color: Colors.black
                            ),
                          ],
                          fontSize: appState.normalSize,
                          fontWeight: FontWeight.normal,
                        ),),
                      Icon(Icons.priority_high_rounded,
                      color: Colors.amber,
                      size: 20,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 8, 3),
                        child: SizedBox(
                          width: AppLayout.getWidth(90),
                          child: TextField(
                            controller: dateToController, 
                            textAlign: TextAlign.right,
                            obscureText: false,  
                            decoration: InputDecoration( 
                              border: UnderlineInputBorder(),  
                              //labelText: 'نام کاربری',  
                              hintText: 'تا '  
                            ),  
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 8, 3),
                        child: SizedBox(
                          width: AppLayout.getWidth(90),
                          child: TextField(
                            controller: dateFromController, 
                            textAlign: TextAlign.right,
                            obscureText: false,  
                            decoration: InputDecoration( 
                              border: UnderlineInputBorder(),  
                              //labelText: 'نام کاربری',  
                              hintText: ' تاریخ از'  
                            ),  
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 8, 3),
                        child: SizedBox(
                          width: AppLayout.getWidth(140),
                          child: TextField(
                            controller: tripNumberController, 
                            textAlign: TextAlign.right,
                            obscureText: false,  
                            decoration: InputDecoration( 
                              border: UnderlineInputBorder(),  
                              //labelText: 'نام کاربری',  
                              hintText: 'شماره سفارش'  
                            ),  
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DataTable(
                  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
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
                            DataCell(Center(child: Text(i.price, textAlign:TextAlign.center, style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.bold),))),
                            DataCell(Center(child: Text(i.dateAndTime, textAlign:TextAlign.center))),
                            DataCell(Center(child: Text(i.type, textAlign:TextAlign.center))),
                            DataCell(Center(child: Text(i.number, textAlign:TextAlign.center))),
                          ],
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}