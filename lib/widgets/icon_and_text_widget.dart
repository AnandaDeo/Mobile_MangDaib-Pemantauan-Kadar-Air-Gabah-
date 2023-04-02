import 'package:belajar/widgets/small_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';

class IconAndaTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndaTextWidget({super.key, 
  required this.icon, 
  required this.text, 
  required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text),

      ],
    );
  }
}