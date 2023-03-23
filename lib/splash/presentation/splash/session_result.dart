abstract class SessionResult {
  final String message;

  SessionResult({required this.message});
}

class SessionSuccess extends SessionResult {
  SessionSuccess() : super(message: '');
}

class SessionError extends SessionResult {
  SessionError({required String message}) : super(message: message);
}