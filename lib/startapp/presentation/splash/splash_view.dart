import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';
import 'package:user_cedtodo/startapp/presentation/splash/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer? _timer;
  final _splashViewModel = getIt<SplashViewModel>();

  _bind() {
    _splashViewModel.start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _splashViewModel.sessionOutput.listen((event) {
        _timer = Timer(const Duration(seconds: 2), () {
          if (event is GenericSuccess) {
            context.go(AppRoutes.restaurants);
          } else {
            context.go(AppRoutes.login);
          }
        });
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _splashViewModel.finish();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SizedBox(width: 100,height: 100,child: FlutterLogo())),
    );
  }
}