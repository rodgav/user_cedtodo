import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/authenticator/application/authenticator_dependency_injection.dart';
import 'package:user_cedtodo/authenticator/presentation/login/login_view.dart';
import 'package:user_cedtodo/authenticator/presentation/recover_password/recover_password_view.dart';
import 'package:user_cedtodo/authenticator/presentation/recover_password_confirm/recover_password_confirm_view.dart';
import 'package:user_cedtodo/authenticator/presentation/register/register_view.dart';
import 'package:user_cedtodo/delivery/presentation/chat/chat_view.dart';
import 'package:user_cedtodo/delivery/presentation/delivery/delivery_view.dart';
import 'package:user_cedtodo/home/presentation/home/home_view.dart';
import 'package:user_cedtodo/home/presentation/home/pages/profile/profile_view.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_view.dart';
import 'package:user_cedtodo/purchase/presentation/cart/cart_view.dart';
import 'package:user_cedtodo/purchase/presentation/finalize_purchase/finalize_purchase_view.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';
import 'package:user_cedtodo/startapp/presentation/splash/splash_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRoute {
  static final route = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    routerNeglect: true,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashView()),
      GoRoute(
          path: AppRoutes.login,
          builder: (context, state) {
            initLogin();
            return const LoginView();
          }),
      GoRoute(
          path: AppRoutes.register,
          builder: (context, state) {
            initRegister();
            return const RegisterView();
          }),
      GoRoute(
          path: AppRoutes.recoverPassword,
          builder: (context, state) {
            initRecoverPassword();
            return const RecoverPasswordView();
          }),
      GoRoute(
          path: AppRoutes.recoverPasswordConfirm,
          builder: (context, state) {
            initRecoverPasswordConfirm();
            return const RecoverPasswordConfirmView();
          }),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, widget) {
            return HomeView(widget: widget);
          },
          routes: [
            GoRoute(
                path: AppRoutes.restaurants,
                builder: (context, state) {
                  return const RestaurantsView();
                },
                routes: [
                  GoRoute(
                      path: '${AppRoutes.restaurant}/:id',
                      builder: (context, state) {
                        final restaurantId = state.params['id'];
                        return RestaurantView(
                          restaurantId: restaurantId,
                        );
                      })
                ]),
            GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) {
                  return const ProfileView();
                }),
          ]),
      GoRoute(
          path: AppRoutes.cart,
          builder: (context, state) {
            return const CartView();
          }),
      GoRoute(
          path: AppRoutes.finalizePurchase,
          builder: (context, state) {
            return const FinalizePurchaseView();
          }),
      GoRoute(
          path: AppRoutes.delivery,
          builder: (context, state) {
            return const DeliveryView();
          }),
      GoRoute(
          path: AppRoutes.chat,
          builder: (context, state) {
            return const ChatView();
          }),
    ],
    errorBuilder: (context, state) => _unDefinedRoute(),
    /*redirect: (context, state) async {
        final isLogged = (await getSessionUseCase.execute(null))
            .fold((l) => false, (r) => true);
        final routesNotLogged = state.subloc == AppRoutes.splash ||
            state.subloc == AppRoutes.login ||
            state.subloc == AppRoutes.register ||
            state.subloc == AppRoutes.recoverPassword ||
            state.subloc == AppRoutes.recoverPasswordConfirm;
        if (!isLogged) return routesNotLogged ? null : AppRoutes.splash;
        return null;
      }*/
  );

  static _unDefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('notFound'),
      ),
      body: const Center(child: Text('notFound')),
    );
  }
}

extension AppRouteExtension on BuildContext {
  back() => canPop() ? pop() : go(AppRoutes.splash);
}
