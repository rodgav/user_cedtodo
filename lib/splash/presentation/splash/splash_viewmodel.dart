import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/startapp/domain/usecase/get_session.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel
    with SplashViewModelInput, SplashViewModelOutput {
  final GetSessionUseCase _getSessionUseCase;

  SplashViewModel(this._getSessionUseCase);

  BehaviorSubject<SessionResult> _sessionStreCtrl =
      BehaviorSubject<SessionResult>();

  @override
  start() {
    if (_sessionStreCtrl.isClosed) {
      _sessionStreCtrl = BehaviorSubject<SessionResult>();
    }
    _getSession();
    return super.start();
  }

  @override
  finish() {
    _sessionStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<SessionResult> get sessionInput => _sessionStreCtrl.sink;

  @override
  Stream<SessionResult> get sessionOutput =>
      _sessionStreCtrl.stream.map((session) => session);

  _getSession() async {
    (await _getSessionUseCase.execute(null)).fold(
        (l) => _sessionStreCtrl.add(SessionError(message: l.message)),
        (r) => SessionSuccess());
  }
}

abstract class SplashViewModelInput {
  Sink<SessionResult> get sessionInput;
}

abstract class SplashViewModelOutput {
  Stream<SessionResult> get sessionOutput;
}

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
