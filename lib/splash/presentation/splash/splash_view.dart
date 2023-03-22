import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/splash/presentation/splash/splash_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

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
        _timer = Timer(const Duration(seconds: 5), () {
          if (event is SessionSuccess) {
            context.go(AppRoutes.restaurants);
          } else if (event is SessionError) {
            showDialogError(context, event.message);
          } else {
            showDialogError(context, 'Ocurrio un error intentelo mas tarde');
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('splash'),
      ),
    );
  }
}
