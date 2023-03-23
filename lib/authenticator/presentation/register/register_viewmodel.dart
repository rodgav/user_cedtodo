import 'package:user_cedtodo/authenticator/domain/usecases/create_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  final CreateUseCase _createUseCase;

  RegisterViewModel(this._createUseCase);
}

abstract class RegisterViewModelInput {}

abstract class RegisterViewModelOutput {}
