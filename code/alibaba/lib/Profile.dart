import 'dart:io';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'MyHomePage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String firstName = "نام";
  String lastName = "نام خانوادگی";
  double accBalance = 0;
  String Email = "Example@sbu.ac.com";
  String PhoneNumber = "09121234567";
  String emergencyNumber = "09121234567";
  String dateOfBirth = "2023/10/6";
  String socialNum = "1234678";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
            child: ClipOval(
                child: Image.network(
                    "https://cdn2.iconfinder.com/data/icons/education-92/100/44-512.png")),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                firstName + "  " + lastName,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "موجودی حساب: $accBalance",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Center(
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text("افزایش موجودی", style: TextStyle(fontSize: 12))),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        ": اطلاعات حساب کاربری",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.info_outline_rounded),
                    ],
                  )),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                        height: MediaQuery.of(context).size.height * .04,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 51, 129, 168),
                          onPressed: () {},
                          child: Text("ویرایش رمز عبور",
                              style: TextStyle(fontSize: 12)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Row(
                            children: [
                              Icon(Icons.edit, size: 12),
                              Text("ویرایش", style: TextStyle(fontSize: 12)),
                            ],
                          )),
                      SizedBox(height: 10),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Row(
                            children: [
                              Icon(Icons.edit, size: 12),
                              Text("ویرایش", style: TextStyle(fontSize: 12)),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Text(PhoneNumber,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(Email,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(":شماره مبایل", style: TextStyle(fontSize: 13)),
                      SizedBox(height: 10),
                      Text(":ایمیل", style: TextStyle(fontSize: 13)),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),

          //personal info :

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Text("ویرایش", style: TextStyle(fontSize: 12)),
                      Icon(Icons.edit, size: 12),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text(
                        ": اطلاعات شخصی",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(socialNum,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(dateOfBirth,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(" :کد ملی", style: TextStyle(fontSize: 13)),
                      SizedBox(height: 10),
                      Text(":تاریخ تولد", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(firstName + " " + lastName,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(emergencyNumber,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(":نام و نام خانوادگی",
                          style: TextStyle(fontSize: 13)),
                      SizedBox(height: 10),
                      Text(":شماره تماس ضروری", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
