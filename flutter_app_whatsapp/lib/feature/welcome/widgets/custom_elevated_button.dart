import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';

class CustomElevatedButton extends StatelessWidget {

  // 加上这些属性，就让组件开始变得复用起来
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    super.key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 42,
        width: buttonWidth ?? MediaQuery.of(context).size.width - 150,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text,style: TextStyle(color: context.color.langBtnBgColor),),
        ));
  }
}
