import 'package:hive_flutter/hive_flutter.dart';
import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/startapp/data/local/adapters/session_adapter.dart';
import 'package:user_cedtodo/startapp/data/network/constants.dart';

class StartAppHiveService {
  final Box<SessionCacheAdapter> _sessionBox;
  final int _expirationTimeInMinutes = 1;

  StartAppHiveService(this._sessionBox);

  Future<models.Session?> getSession() async {
    final sessionAdapter = _sessionBox.get(Constants.sessionAdapter);
    if (sessionAdapter != null) {
      final session = sessionAdapter.session;
      final timeStamp = sessionAdapter.dateTime;
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
    final sessionAdapter = SessionCacheAdapter(session: session, dateTime: dateTime);
    await _sessionBox.clear();
    await _sessionBox.put(Constants.sessionAdapter, sessionAdapter);
  }
}
