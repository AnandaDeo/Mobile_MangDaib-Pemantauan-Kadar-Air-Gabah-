import 'package:belajar/pages/home/login.dart';
import 'package:belajar/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:belajar/widgets/big_text.dart';
import 'package:belajar/pages/home/gabah_page_body.dart';
import 'package:belajar/utilities/dimensi.dart';
class MainMonitoringPage extends StatefulWidget {
  const MainMonitoringPage({super.key});

  @override
  State<MainMonitoringPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainMonitoringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //show the header 
          Container(
            child: Container(
              margin: EdgeInsets.only(top:Dimensions.height45, bottom:Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                        BigText(text: "MangDaib", color:Color.fromARGB(255, 38, 172, 29)),

                      ],
                    ), 
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LoginPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\' have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Login',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                        ),
                        ),

              )],       
                ),
              ),
            ),
            //showing page body
            Expanded(child: SingleChildScrollView(
              child: GabahPageBody(),
            )),
          ],
        ),
      );
    }
}