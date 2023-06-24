// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  //สร้างตัวแปรฝั่งรับเพื่อรับข้อมูล แล้วนำไปใช้งาน
  String? money;
  String? person;
  String? tip;

  //ที่คอนสตรักเตอร์ นำตัวแปรฝั่งรับที่สร้างมากำหนัดเพื่อรับค่าจากฝั่งที่ส่งมา
  ShowMoneyShareUI({super.key, this.money, this.person, this.tip});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  var nf = NumberFormat('###,##0.00',
      "en_US"); //ต้องครอบตัวเลขเท่านั้น ถ้าเป็นสตริง ต้องงแปลงก่อน

  double? moneyShare = 0;
  @override
  //method จะมีแค่ใน Stateful จะทำงานก่อนทุกครั้งที่หน้าจอจะแสดง
  void initState() {
    //คำนวณเงินที่จะแชร์กัน เก็บในตัวแปรที่สร้างไว้
    //ต้องแปลงข้อมูลเป็นตัวเลขก่อน
    double money = double.parse(widget.money!);
    int person = int.parse(widget.person!);
    double tip = double.parse(widget.tip!);

    //คำนวณ
    moneyShare = (money + tip) / person;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 165, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 79, 95),
        title: Text(
          'แชร์เงินกันเถอะ (ผลลัพธ์)',
          style: GoogleFonts.itim(
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Image.asset(
                'assets/images/money.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'จำนวนเงินที่จะแชร์กัน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                nf.format(double.parse(widget.money!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'จำนวนคนที่จะแชร์กัน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                widget.person!,
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'คน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                nf.format(double.parse(widget.tip!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 246, 79, 95)),
                child: Center(
                  child: Text(
                    nf.format(moneyShare),
                    style: GoogleFonts.itim(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
