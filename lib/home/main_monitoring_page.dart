import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:belajar/utilities/app_colors.dart';
import 'package:belajar/utilities/color.dart';
import 'package:belajar/widgets/big_text.dart';
import 'package:belajar/widgets/small_text.dart';
import 'package:belajar/home/gabah_page_body.dart';
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
                        BigText(text: "Validator", color:Color.fromARGB(255, 38, 172, 29)),
                        Row(
                          children: [
                            Icon(Icons.person_2_rounded),
                            SmallText(text: "Fullan", color:Colors.black87)
                            
                        ],)

                      ],
                    ), 
                  Center(
                    child: Container(
                        width:Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search, color:Colors.white, size:Dimensions.iconSize24),
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.pastelPink,
                        ),
                      ),
                  )
                  ],
                ),
              ),
            ),
            //showing page body
            GabahPageBody(),
          ],
        ),
      );
    }
}