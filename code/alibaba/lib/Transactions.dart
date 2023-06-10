import 'package:alibaba/screens/utils/Styles.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle decrease = TextStyle(color: Colors.red);
    TextStyle increase = TextStyle(color: Colors.green);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: DataTable(
          columns: [
            DataColumn(
                label: Text(
              "میزان تراکنش",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text("نوع تراکنش",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("تاریخ",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("-3000000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2023/6/10 "))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+4000000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2023/5/2"))
            ]),
            DataRow(cells: [
              DataCell(Text("-4569000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2023/1/10 "))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+93857000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/11/2"))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+70057000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/10/2"))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+1208000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/10/1"))
            ]),
            DataRow(cells: [
              DataCell(Text("-7069000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/9/10 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-8069000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/8/23 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-4569000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/8/10 "))
            ]),
            DataRow(
              cells: [
                DataCell(Text(
                  "+4000000 ",
                  style: increase,
                )),
                DataCell(Text(" افزایش شارژ (واریز)")),
                DataCell(Text(" 2022/8/1"))
              ],
            ),
            DataRow(cells: [
              DataCell(Text(
                "+1208000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/7/1"))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+1208000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/7/1"))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+9008000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/5/28"))
            ]),
            DataRow(cells: [
              DataCell(Text(
                "+10208000 ",
                style: increase,
              )),
              DataCell(Text(" افزایش شارژ (واریز)")),
              DataCell(Text(" 2022/5/19"))
            ]),
            DataRow(cells: [
              DataCell(Text("-2000000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/5/13 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-5020000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/8/11 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-8069000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/5/10 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-8069000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/4/23 "))
            ]),
            DataRow(cells: [
              DataCell(Text("-4569000", style: decrease)),
              DataCell(Text(" کاهش شارژ (خرید خدمات)")),
              DataCell(Text("2022/2/10 "))
            ]),
          ],
        )),
      ),
    );
  }
}
