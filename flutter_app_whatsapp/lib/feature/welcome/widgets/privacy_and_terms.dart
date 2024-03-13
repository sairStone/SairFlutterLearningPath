import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/utils/coloors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: '使用协议',
              style: TextStyle(color: Coloors.blueDark)),
          TextSpan(
              text: '了解相关信息，', style: TextStyle(color: Colors.grey)),
          TextSpan(text: '并点击', style: TextStyle(color: Colors.grey)),
          TextSpan(
              text: '同意且继续',
              style: TextStyle(color: Coloors.blueDark)),
          TextSpan(
              text: '来接受本产品的使用',
              style: TextStyle(color: Colors.grey)),
        ], text: '请阅读', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}