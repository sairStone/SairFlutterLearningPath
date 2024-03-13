
import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';
import 'package:flutter_app_whatsapp/common/utils/coloors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  // 升起的语言列表
  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close_outlined)),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          'App Language',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: .5,
                    color: context.color.greyColor!.withOpacity(0.3),
                  ),
                  RadioListTile(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                    activeColor: Coloors.greenDark,
                    title:  Text('中文',),
                    subtitle: Text(
                      '手机默认字体',
                      style: TextStyle(color: context.color.greyColor),
                    ),
                  ),
                  RadioListTile(
                    value: true,
                    groupValue: false,
                    onChanged: (value) {},
                    activeColor: Coloors.greenDark,
                    title:  Text('English',),
                    subtitle: Text(
                      'Amharic',
                      style: TextStyle(color: context.color.greyColor),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          // 点击 中文 从下升起语言选择列表
          showBottomSheet(context);
        },
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.color.langBtnHighlightColor,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 屏幕位置居中
            mainAxisSize: MainAxisSize.min, // 占据最少宽度
            children: [
              Icon(
                Icons.language,
                color: Coloors.greenDark,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '中文',
                style: TextStyle(color: Coloors.greenDark),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Coloors.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
