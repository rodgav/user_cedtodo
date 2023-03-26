import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_cedtodo/startapp/data/local/adapters/session_adapter.dart';
import 'package:user_cedtodo/startapp/data/network/constants.dart';

class HiveFactory {
  Future<Box<SessionCacheAdapter>> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SessionAdapterAdapter());
    Hive.registerAdapter(SessionAdapter());
    return await Hive.openBox<SessionCacheAdapter>(Constants.sessionBox);
  }
}
