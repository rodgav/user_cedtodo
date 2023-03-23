import 'package:user_cedtodo/authenticator/domain/usecases/update_recovery_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';

class RecoverPasswordConfirmViewModel extends BaseViewModel
    with
        RecoverPasswordConfirmViewModelInput,
        RecoverPasswordConfirmViewModelOutput {
  final UpdateRecoveryUseCase _updateRecoveryUseCase;

  RecoverPasswordConfirmViewModel(this._updateRecoveryUseCase);
}

abstract class RecoverPasswordConfirmViewModelInput {}

abstract class RecoverPasswordConfirmViewModelOutput {}
