import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';
import 'package:flutter_app_whatsapp/common/helper/show_alert_dialog.dart';
import 'package:flutter_app_whatsapp/common/utils/coloors.dart';
import 'package:flutter_app_whatsapp/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_app_whatsapp/feature/welcome/widgets/custom_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// 写完页面UI,再对功能进行设置
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      showAlertDialog(
        context: context,
        message: '请输入您的手机号码',
      );
    } else if (phone.length != 11) {
      showAlertDialog(
        context: context,
        message: '您的手机号码有误，请重新输入',
      );
    }
  }

  showCoutryCodePicker() {}

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'China');
    countryCodeController = TextEditingController(text: '86');
    phoneNumberController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          '请输入您的手机号码',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            splashRadius: 22,
            iconSize: 22,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40),
            icon: const Icon(Icons.more_vert),
            color: context.color.greyColor,
          )
        ],
      ),
      body: Column(
        children: [
          RichText(
              text: TextSpan(
                  text: 'Sair IMAPP 需要验证您的手机号码。\n',
                  style: TextStyle(
                    color: context.color.greyColor,
                    height: 1.5,
                  ),
                  children: [
                TextSpan(
                    text: '请问您的手机号码是多少？',
                    style: TextStyle(
                      color: context.color.blueColor,
                    ))
              ])),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: () {},
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                // 用上了自己定义的custom_text_field组件
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: () {},
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                    onTap: () {},
                    controller: phoneNumberController,
                    hintText: '手机号码',
                    textAlign: TextAlign.left,
                    // keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '可能会有短信费用生成',
            style: TextStyle(color: context.color.greyColor),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        // 将 onPressed 的赋值改为 onPressed: sendCodeToPhone，而不是立即调用 sendCodeToPhone() 方法。
        // 通过这样的修改，你将传递一个函数引用给 onPressed，而不是直接调用该函数。
        onPressed: sendCodeToPhone,
        text: '下一步',
        buttonWidth: 100,
      ),
    );
  }
}
