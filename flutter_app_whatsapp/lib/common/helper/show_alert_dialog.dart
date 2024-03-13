import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message,
            style: TextStyle(color: context.color.greyColor, fontSize: 15),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  btnText ?? 'OK',
                  style: TextStyle(
                    color: context.color.circleImageColor,
                  ),
                ))
          ],
        );
      });
}
