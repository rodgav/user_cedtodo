import 'package:flutter/material.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/route.dart';

showDialogMessage(BuildContext context,
    {String title = 'Error',
    String message = 'Ocurrio un error, intentelo dentro un momento',
    String? leftText,
    VoidCallback? leftOnPressed,
    String rightText = 'Accept',
    VoidCallback? rightOnPressed}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Error dialog'),
          content: Text(message),
          actions: [
            leftText != null
                ? ElevatedButton(
                    onPressed: leftOnPressed ?? context.back,
                    child: const Text('cancel'))
                : const SizedBox(),
            ElevatedButton(
                onPressed: rightOnPressed ?? context.back,
                child: Text(rightText)),
          ],
        );
      });
}
