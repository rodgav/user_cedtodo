import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/route.dart';

showDialogError(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Error dialog'),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: context.back, child: const Text('cancel')),
            ElevatedButton(
                onPressed: () => _.pop(), child: const Text('accept')),
          ],
        );
      });
}
