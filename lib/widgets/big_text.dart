import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:belajar/utilities/dimensi.dart';
import 'package:flutter/cupertino.dart';
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({Key? key, this.color = const Color(0xFF98FB98), required this.text, this.size=20,this.overflow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: Dimensions.font20,
        fontWeight: FontWeight.w400
      )
    );
  }
}