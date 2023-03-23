import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_recovery_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class RecoverPasswordViewModel extends BaseViewModel
    with RecoverPasswordViewModelInput, RecoverPasswordViewModelOutput {
  final CreateRecoveryUseCase _createRecoveryUseCase;

  RecoverPasswordViewModel(this._createRecoveryUseCase);

  BehaviorSubject<GenericResult> _recoverPasswordStreCtrl =
      BehaviorSubject<GenericResult>();

  @override
  start() {
    if (_recoverPasswordStreCtrl.isClosed) {
      _recoverPasswordStreCtrl = BehaviorSubject<GenericResult>();
    }
    return super.start();
  }

  @override
  finish() {
    _recoverPasswordStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<GenericResult> get recoverPasswordInput => throw UnimplementedError();

  @override
  Stream<GenericResult> get recoverPasswordOutput => throw UnimplementedError();

  @override
  recover(String email) async {
    (await _createRecoveryUseCase.execute(email)).fold(
        (l) => recoverPasswordInput.add(GenericError(message: l.message)),
        (r) => recoverPasswordInput.add(GenericSuccess()));
  }
}

abstract class RecoverPasswordViewModelInput {
  Sink<GenericResult> get recoverPasswordInput;

  recover(String email);
}

abstract class RecoverPasswordViewModelOutput {
  Stream<GenericResult> get recoverPasswordOutput;
}
