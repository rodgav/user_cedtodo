import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:user_cedtodo/startapp/application/application.dart';
import 'package:user_cedtodo/startapp/application/dependency_injection.dart';

final getIt = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  runApp(const Application());
}


