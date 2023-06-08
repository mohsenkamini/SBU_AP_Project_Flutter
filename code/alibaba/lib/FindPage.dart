import 'package:alibaba/Login.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'MyHomePage.dart';
import 'Widgets/TicketCatalog.dart';

class FindPage extends StatefulWidget {
  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'مرتب سازی'; 
    var items =['مرتب سازی' ,'پیشنهاد علی‌بابا', 'زودترین', 'دیرترین', 'ارزان‌ترین','گران‌ترین'];

    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor:  appState.backgroundColor,
    appBar: AppBar(
      backgroundColor: appState.barColor,
      centerTitle: true,

      title: Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Text(
      
              textAlign: TextAlign.right,
              'بلیط هواپیما تهران به اهواز',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              textAlign: TextAlign.right,
              'پنجشنبه ۸ تیر ۱۰ نفر',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: appState.header3Size,
              ),
            ),
          ],
        ),
      ),

    ),
    body: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: new BoxConstraints(
            minHeight: 35.0,
            maxHeight: 65.0,
            ),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_back_ios)
                        ),
                      ),Container(decoration: BoxDecoration(
                        color: appState.columnColor,
                        border: Border.all(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                        height: 60,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'ی - ۰۴/۰۴ تکمیل',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: appState.header3Size,
                            ),
                          ),
                        ),
                      ),Container(
                        decoration: BoxDecoration(
                        color: appState.columnColor,
                        border: Border.all(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                        height: 60,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'ی - ۰۴/۰۴ ۱,۲۰۷',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: appState.header3Size,
                            ),
                          ),
                        ),
                      ),Container(
                        decoration: BoxDecoration(
                          color: appState.columnColor,
                          border: Border.all(
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 60,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'ی - ۰۴/۰۴ تکمیل',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: appState.header3Size,
                            ),
                          ),
                        ),
                      ),Container(
                        decoration: BoxDecoration(
                          color: appState.columnColor,
                          border: Border.all(
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 60,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'ی - ۰۴/۰۴ ۱,۲۰۷',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: appState.header3Size,
                            ),
                          ),
                        ),
                      ), 
                      Container(
                        width: 30,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward_ios),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: new BoxConstraints(
            minHeight: 35.0,
            maxHeight: 70.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.sort),    
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) { 
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindPage() // this should be changed to filters page
                          )
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'فیلتر‌ها',
                          style: TextStyle(
                            fontSize: appState.header3Size,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Icon(
                          Icons.filter_list_rounded,
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ListView(
                 children: [ 
                  TicketCatalog(
                    airlineName: "ایران ایر",
                    airlineImageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx9DB25fTRofwq7hyc4i1m2g35pxyS1FKiUEXBk19VKDlfGVR0KOZKnYzWzzAdBn7k&usqp=CAU",
                    tag1: "سیستمی", 
                    tag2: "اکونومی", 
                    tag3: "Fokker ۱۰۰", 
                    takeOffTime: "۰۶:۱۰", 
                    landingTime: "۰۷:۳۰", 
                    price: "۱۲,۰۷۰,۰۰۰", 
                    booked: 34, 
                    capacity: 200,
                  ),
                 ],
               ),
             ),
          ),
        ],
      ),
    ),
    );
  }
}