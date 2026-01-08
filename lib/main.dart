import 'dart:math';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MainApp());
}
 
class MainApp extends StatefulWidget {
  const MainApp({super.key});
 
  @override
  State<MainApp> createState() => _MainAppState();
}
 
class _MainAppState extends State<MainApp> {
  int diceNumber = 1;
  var activateDice = 'assets/images/dice-1.png';
 
  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      activateDice = 'assets/images/dice-$diceNumber.png';
      print(activateDice);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body ต้องครอบคลุม Widget ทั้งหมดในหน้านี้
        body: Container(
          width: double.infinity, // ทำให้ Container กว้างเต็มจอ
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color.fromARGB(255, 10, 200, 26), Color.fromARGB(255, 0, 0, 0)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลางแนวตั้ง
            children: [
              // 1. เพิ่ม Widget แสดงรูปภาพ
              Image.asset(
               
                activateDice,
                width: 200,
              ),
              const SizedBox(height: 40), // ระยะห่างระหว่างรูปกับปุ่ม
             
              // 2. ปุ่มกด (ย้ายเข้ามาอยู่ใน Column)
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 18, 1),
                  foregroundColor: Colors.white, // สีตัวอักษรบนปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: rollDice, // เชื่อมต่อฟังก์ชันที่เขียนไว้
                child: const Text('Roll the dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
