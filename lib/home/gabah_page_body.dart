import 'package:belajar/widgets/big_text.dart';
import 'package:belajar/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:belajar/widgets/icon_and_text_widget.dart';
import 'package:belajar/utilities/app_colors.dart';
import 'package:belajar/utilities/dimensi.dart';

class GabahPageBody extends StatefulWidget {
  const GabahPageBody({super.key});

  @override
  State<GabahPageBody> createState() => _GabahPageBodyState();
}

class _GabahPageBodyState extends State<GabahPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor =0.8;
  double _height = Dimensions.pageViewContainer;
  
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
              itemCount: 6,
              itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
        ),
        new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.deepPurple,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );

  }
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      
    }else if(index == _currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height:  Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xFFFF6961):Color(0xFF9295cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/padi1.jpg"
                )
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top:Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Lahan Kami", color: Colors.black,),
                    SizedBox(height: Dimensions.height10,),
                    Column(
                      children: [
                        SmallText(
                          text: limitText("lorem ipsum deler dadasdadasdasdadadadasdasdropaffafafaddqdqdqdqwdqwdqdwqdqdqfafafsafafafafaf"),
                          color: Colors.black
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndaTextWidget(icon: Icons.circle_sharp,
                            text: "Normal",
    
                            iconColor:AppColors.pastelRed,),
                        IconAndaTextWidget(icon: Icons.location_on,
                            text: "2.5Km",
    
                            iconColor: AppColors.pastelBlue,),
                        IconAndaTextWidget(icon: Icons.access_time_rounded,
                            text: "15Min",
    
                            iconColor:AppColors.lightGreen,),
                      ],
                      
                    )
                ]),
              ),
              
            ),
          )
        ],
      ),
    );
  }
}


String limitText(String text) {
  if (text.length <= 10) {
    return text;
  } else {
    return text.substring(0, 9) + '...';
  }
}