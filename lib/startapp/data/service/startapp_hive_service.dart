import 'package:hive_flutter/hive_flutter.dart';
import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/startapp/data/local/adapters/session_adapter.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

class StartAppHiveService {
  final Box<SessionCacheAdapter> _sessionBox;
  final int _expirationTimeInMinutes = 1;

  StartAppHiveService(this._sessionBox);

  Future<models.Session?> getSession() async {
    final sessionCacheAdapter = _sessionBox.get(Constants.sessionCacheAdapter);
    if (sessionCacheAdapter != null) {
      final session = sessionCacheAdapter.session;
      final timeStamp = sessionCacheAdapter.dateTime;
      if (DateTime.now().difference(timeStamp) >
          Duration(minutes: _expirationTimeInMinutes)) {
        await _sessionBox.clear();
        return null;
      }
      return session;
    }
    return null;
  }

  Future<void> putSession(models.Session session)async {
    final dateTime = DateTime.now();
    final sessionCacheAdapter = SessionCacheAdapter(session: session, dateTime: dateTime);
    await _sessionBox.clear();
    await _sessionBox.put(Constants.sessionCacheAdapter, sessionCacheAdapter);
  }
}
