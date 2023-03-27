import 'package:rxdart/rxdart.dart';

class BaseViewModel extends BaseViewModelInput with BaseViewModelOutput {
  BehaviorSubject<String> _toastMessage = BehaviorSubject<String>();

  @override
  finish() {
    _toastMessage.close();
  }

  @override
  start() {
    if (_toastMessage.isClosed) {
      _toastMessage = BehaviorSubject<String>();
    }
  }

  @override
  Sink<String> get toastMessageInput => _toastMessage.sink;

  @override
  Stream<String> get toastMessageOutput =>
      _toastMessage.stream.map((toastMessage) => toastMessage);

  @override
  setToastMessage(String message) {
    toastMessageInput.add(message);
  }
}

abstract class BaseViewModelInput {
  start();

  finish();

  setToastMessage(String message);

  Sink<String> get toastMessageInput;
}

abstract class BaseViewModelOutput {
  Stream<String> get toastMessageOutput;
}
