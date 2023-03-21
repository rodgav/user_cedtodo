import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.restaurants);
              },
              child: const Text('restaurants')),
          ElevatedButton(
              onPressed: () {
                context.push(AppRoutes.recoverPassword);
              },
              child: const Text('recover password')),
          ElevatedButton(
              onPressed: () {
                context.push(AppRoutes.register);
              },
              child: const Text('register')),
        ],
      ),
    );
  }
}
