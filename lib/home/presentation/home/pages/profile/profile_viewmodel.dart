import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/home/domain/usecases/delete_session_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_account_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_initials_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  final DeleteSessionUseCase _deleteSessionUseCase;
  final GetAccountUseCase _getAccountUseCase;
  final GetInitialsUseCase _getInitialsUseCase;

  ProfileViewModel(this._deleteSessionUseCase, this._getAccountUseCase,
      this._getInitialsUseCase);

  BehaviorSubject<models.Account?> _accountStreCtrl =
      BehaviorSubject<models.Account?>();
  BehaviorSubject<Uint8List?> _initialsStreCtrl = BehaviorSubject<Uint8List?>();
  BehaviorSubject<GenericResult> _genericResultStreCtrl =
      BehaviorSubject<GenericResult>();

  @override
  start() async {
    if (_accountStreCtrl.isClosed) {
      _accountStreCtrl = BehaviorSubject<models.Account?>();
    }
    if (_initialsStreCtrl.isClosed) {
      _initialsStreCtrl = BehaviorSubject<Uint8List?>();
    }
    if (_genericResultStreCtrl.isClosed) {
      _genericResultStreCtrl = BehaviorSubject<GenericResult>();
    }
    await getAccount();
    await getInitials();
    return super.start();
  }

  @override
  finish() {
    _accountStreCtrl.close();
    _initialsStreCtrl.close();
    _genericResultStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<models.Account?> get accountInput => _accountStreCtrl.sink;

  @override
  Sink<Uint8List?> get initialsInput => _initialsStreCtrl.sink;

  @override
  Sink<GenericResult> get genericResultInput => _genericResultStreCtrl.sink;

  @override
  Stream<models.Account?> get accountOutput =>
      _accountStreCtrl.stream.map((account) => account);

  @override
  Stream<Uint8List?> get initialsOutput =>
      _initialsStreCtrl.stream.map((initials) => initials);

  @override
  Stream<GenericResult> get genericResultOutput =>
      _genericResultStreCtrl.stream.map((genericResult) => genericResult);

  @override
  deleteSession() async {
    (await _deleteSessionUseCase.execute(null)).fold(
        (l) => genericResultInput.add(GenericError(message: l.message)),
        (r) => genericResultInput.add(GenericSuccess()));
  }

  @override
  getAccount() async {
    (await _getAccountUseCase.execute(null))
        .fold((l) => accountInput.add(null), (r) => accountInput.add(r));
  }

  @override
  getInitials() async {
    (await _getInitialsUseCase.execute(null))
        .fold((l) => initialsInput.add(null), (r) => initialsInput.add(r));
  }
}

abstract class ProfileViewModelInput {
  deleteSession();

  getAccount();

  getInitials();

  Sink<models.Account?> get accountInput;

  Sink<Uint8List?> get initialsInput;

  Sink<GenericResult> get genericResultInput;
}

abstract class ProfileViewModelOutput {
  Stream<models.Account?> get accountOutput;

  Stream<Uint8List?> get initialsOutput;

  Stream<GenericResult> get genericResultOutput;
}
