import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';
import 'package:flutter_app_whatsapp/common/utils/coloors.dart';
import 'package:flutter_app_whatsapp/feature/welcome/widgets/custom_elevated_button.dart';
import 'package:flutter_app_whatsapp/feature/welcome/widgets/language_button.dart';
import 'package:flutter_app_whatsapp/feature/welcome/widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 下面注释掉的代码，说明已经重写系统样式，然后可以根据系统切换主题了，在common/theme
      // backgroundColor: Coloors.backgroundDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Image.asset(
                'assets/images/cicrle.png',
                // color: Coloors.greenDark, 原本使用Coloors类，下面是使用extension扩展后的
                color: context.color.circleImageColor,
              ),
            ),
          )),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              RichText(
                textAlign: TextAlign.center,
                text:   TextSpan(
                    text: 'Welcome Sair IM App',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: context.color.authAppbarTextColor )),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                        text: '这是一个简单的', style: TextStyle(color: context.color.greyColor)),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: '即时通信APP',
                        style: TextStyle(color: Coloors.greenDark)),
                  ),
                ],
              ),
              const PrivacyAndTerms(),
              CustomElevatedButton(
                onPressed: (){

                },
                text: '同意且继续',
              ),
              const SizedBox(
                height: 50,
              ),
              const LanguageButton()
            ],
          )),
        ],
      ),
    );
  }
}
