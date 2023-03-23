
abstract class GenericResult {
  final String message;

  GenericResult({required this.message});
}

class GenericSuccess extends GenericResult {
  GenericSuccess() : super(message: '');
}

class GenericError extends GenericResult {
  GenericError({required String message}) : super(message: message);
}