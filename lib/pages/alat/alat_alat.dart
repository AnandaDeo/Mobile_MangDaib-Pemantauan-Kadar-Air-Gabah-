import 'package:belajar/pages/home/main_monitoring_page.dart';
import 'package:belajar/widgets/exandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:belajar/utilities/dimensi.dart';
import 'package:belajar/widgets/app_icon.dart';
import 'package:belajar/widgets/big_text.dart';
import 'package:belajar/utilities/app_colors.dart';
import '../../widgets/app_collumn.dart';

class AlatAlat extends StatelessWidget {
  const AlatAlat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.alatSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/alat.png"
                  )
                )
              ),
            ),
          ),
         Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => MainMonitoringPage()),
                    );
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.alatSize-20,
            child: Container(
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCollumn(text: "Alat Kami"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Perkenalkan", color: Colors.black,),
                  SizedBox(height: Dimensions.height20),
                  Expanded(child: SingleChildScrollView(child: ExandableText(text:"jfkjfasjkfskjfskjfskjfskjfafaff sfsafafafasfasfasfasfsafasfasfafsfasfsafsafsffafafafafasfafjsajsakjfkjfbskjfbkjfbajbfkjfbakjfbakjfbaksjfbaksjbfakjbfsakjfbaskjfbaskjfbaskjfbaskjfbsakjfbaskjfbsajfbsajfbsajfbaskjfbakjfbakjfbakjfbakjfbakjfbakjfbakjfbakjfbakjfbsakjfbasfb")))
                ],
              ),
          ))
          

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding:EdgeInsets.only(top:Dimensions.height30, bottom:Dimensions.height30, left:Dimensions.width20, right:Dimensions.width20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 229, 229),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, left:Dimensions.width20, right:Dimensions.width20),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                 color: AppColors.indigo
              ),
              child: Row(
                children: [
                  BigText(text: "Pesan", color: Colors.white,),
                  Icon(Icons.call, color: Colors.green)
                ],
              ),
             
            )
            ,Container(
              padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, left:Dimensions.width20, right:Dimensions.width20),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                 color: AppColors.indigo
              ),
              child: Row(
                children: [
                  BigText(text: "Rp..", color: Colors.white,),
                 
                ],
              ),
             
            )
          ],
        ),
      ),
    );
    
  }
}


