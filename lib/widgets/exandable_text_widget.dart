import 'package:belajar/utilities/app_colors.dart';
import 'package:belajar/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/dimensi.dart';


class ExandableText extends StatefulWidget {
  final String text;
  const ExandableText({super.key, required this.text} ) ;

  @override
  State<ExandableText> createState() => _ExandableTextState();
}

class _ExandableTextState extends State<ExandableText> {
  late String firstHalf;
  late String seconHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      seconHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else {
      firstHalf = widget.text;
      seconHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: seconHalf.isEmpty?SmallText(color:AppColors.pastelGrey,size:Dimensions.font16, text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color:AppColors.pastelGrey,size:Dimensions.font16, text: hiddenText?(firstHalf+ "..."):(firstHalf+seconHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Selengkapnya",color: AppColors.indigo,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.indigo)
              ],
            ),
          )
        ],
      ),
    );
  }
}