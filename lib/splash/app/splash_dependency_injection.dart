import 'package:get_it/get_it.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/splash/presentation/splash/splash_viewmodel.dart';
import 'package:user_cedtodo/startapp/domain/usecase/get_session.dart';

void initSplashModule() {
  if (!GetIt.I.isRegistered<SplashViewModel>()) {
    getIt.registerLazySingleton<SplashViewModel>(
        () => SplashViewModel(getIt<GetSessionUseCase>()));
  }
}
