// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_share_app/views/show_money_share_ui.dart';

class InputMoneyShareUI extends StatefulWidget {
  const InputMoneyShareUI({super.key});

  @override
  State<InputMoneyShareUI> createState() => _InputMoneyShareUIState();
}

class _InputMoneyShareUIState extends State<InputMoneyShareUI> {
  //สร้าง Obj ควบคุม textfield
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  //ตัวแปรควบคุม Chkbox
  bool tipCheck = false;

  //สร้าง Method แสดง dialog แบบ Warning dialog เตื่อน Alert
  //context คือหน้าจอตัวเอง
  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.itim(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.itim(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.itim(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 165, 165),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 79, 95),
          title: Text(
            'แชร์เงินกันเถอะ',
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
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (data) {
                        //โค้ดคำสั่งใดก็ตามมีผลต่อการแสดงผลบนจอ ให้เขียนภายใต้ setState
                        setState(() {
                          tipCheck =
                              data!; //เก็บค่ามาจาก value ตอน onchange แล้วมากำหนดค่าให้ tipCheck
                          if (data == false) {
                            //ถ้าเอาติกออก เคลียร์ค่าใน textbox
                            tipCtrl.text = '';
                          }
                        });
                      },
                      value: tipCheck, //ติก หรือไม่ติด ตอน initialized
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 79, 92),
                      ),
                      checkColor: Colors.yellow,
                      activeColor: Color.fromARGB(255, 246, 79, 92),
                    ),
                    Text(
                      'เงินทิป (บาท)',
                      style: GoogleFonts.itim(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    enabled: tipCheck,
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 179, 176, 176),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWheat,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        //validate หน้าจอ เมื่อ validate แล้วจะโชว์ ShowMoneyShareUI
                        if (moneyCtrl.text.isEmpty == true) {
                          //เช็คว่าเป็นค่าว่างไหม
                          _showWarningDialog(context, "ป้อนจำนวนเงินด้วย...");
                        } else if (personCtrl.text.isEmpty == true) {
                          //เช็คว่าเป็นค่าว่างไหม
                          _showWarningDialog(context, "ป้อนจำนวนคนด้วย...");
                        } else if (tipCheck == true) {
                          //เช็คว่าติกไหม
                          if (tipCtrl.text.isEmpty == true) {
                            //เช็คว่าเป็นค่าว่างไหม
                            _showWarningDialog(
                                context, "ป้อนจำนวนเงินทิปด้วย...");
                          } else {
                            //เปิดหน้าจอพร้อมส่งทุกอย่าง
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          //เปิดหน้าจอส่งค่าเว้น tip คือส่งไปเป็น 0
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMoneyShareUI(
                                money: moneyCtrl.text,
                                person: personCtrl.text,
                                tip: "0",
                              ),
                            ),
                          );
                        }
                        //Code เปิดจอื่นและ back กลับมาได้ มี 2 แบบ 1. ย้อนได้ 2. และย้อนไม่ได้ (ถ้าเป็น Android กดย้อยกลับจะทำการบ้านปิดโปรแกรม)
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ShowMoneyShareUI(),
                        //   ),
                        // );
                      },
                      icon: Icon(
                        Icons.calculate,
                      ),
                      label: Text(
                        'คำนวณ',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.37,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                      ),
                      label: Text(
                        'ยกเลิก',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.37,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
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
