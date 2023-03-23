import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/startapp/domain/usecase/get_session.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class SplashViewModel extends BaseViewModel
    with SplashViewModelInput, SplashViewModelOutput {
  final GetSessionUseCase _getSessionUseCase;

  SplashViewModel(this._getSessionUseCase);

  BehaviorSubject<GenericResult> _sessionStreCtrl =
      BehaviorSubject<GenericResult>();

  @override
  start() {
    if (_sessionStreCtrl.isClosed) {
      _sessionStreCtrl = BehaviorSubject<GenericResult>();
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
  Sink<GenericResult> get sessionInput => _sessionStreCtrl.sink;

  @override
  Stream<GenericResult> get sessionOutput =>
      _sessionStreCtrl.stream.map((session) => session);

  _getSession() async {
    (await _getSessionUseCase.execute(null)).fold(
        (l) => _sessionStreCtrl.add(GenericError(message: l.message)),
        (r) => _sessionStreCtrl.add(GenericSuccess()));
  }
}

abstract class SplashViewModelInput {
  Sink<GenericResult> get sessionInput;
}

abstract class SplashViewModelOutput {
  Stream<GenericResult> get sessionOutput;
}
