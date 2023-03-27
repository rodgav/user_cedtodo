import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_cedtodo/startapp/data/local/adapters/session_adapter.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

class HiveFactory {
  Future<void> initHive() async {
    await Hive.initFlutter();
  }
}
