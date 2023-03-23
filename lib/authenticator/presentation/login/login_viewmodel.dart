import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_email_session_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final CreateEmailSessionUseCase _createEmailSessionUseCase;

  LoginViewModel(this._createEmailSessionUseCase);

  BehaviorSubject<GenericResult> _sessionStreCtrl =
      BehaviorSubject<GenericResult>();

  @override
  start() {
    if (_sessionStreCtrl.isClosed) {
      _sessionStreCtrl = BehaviorSubject<GenericResult>();
    }
    super.start();
  }

  @override
  finish() {
    _sessionStreCtrl.close();
    super.finish();
  }

  @override
  Sink<GenericResult> get sessionInput => _sessionStreCtrl.sink;

  @override
  Stream<GenericResult> get sessionOutput =>
      _sessionStreCtrl.stream.map((session) => session);

  @override
  createEmailSession(String email, String password) async {
    (await _createEmailSessionUseCase
            .execute(CreateEmailRequest(email, password)))
        .fold((l) => sessionInput.add(GenericError(message: l.message)),
            (r) => sessionInput.add(GenericSuccess()));
  }
}

abstract class LoginViewModelInput {
  Sink<GenericResult> get sessionInput;

  createEmailSession(String email, String password);
}

abstract class LoginViewModelOutput {
  Stream<GenericResult> get sessionOutput;
}
