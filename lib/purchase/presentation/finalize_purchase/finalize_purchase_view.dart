import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class FinalizePurchaseView extends StatefulWidget {
  const FinalizePurchaseView({Key? key}) : super(key: key);

  @override
  State<FinalizePurchaseView> createState() => _FinalizePurchaseViewState();
}

class _FinalizePurchaseViewState extends State<FinalizePurchaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('finalize purchase'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.delivery);
              },
              child: const Text('delivery'))
        ],
      ),
    );
  }
}
