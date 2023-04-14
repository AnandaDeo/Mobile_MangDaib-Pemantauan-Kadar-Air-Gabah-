// import 'package:belajar/pages/alat/rekomendasi_alat.dart';
import 'package:belajar/pages/alat/rekomendasi_alat.dart';
import 'package:belajar/pages/home/login.dart';
import 'package:belajar/pages/home/main_monitoring.dart';
import 'package:belajar/pages/home/menu.dart';
import 'package:belajar/pages/home/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar/pages/home/main_monitoring_page.dart';
import 'package:get/get.dart';
import 'package:belajar/pages/alat/alat_alat.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomePage ()
    );
  }
}
