import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class HomeView extends StatefulWidget {
  final Widget widget;

  const HomeView({required this.widget, Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _getIndex(),
          onTap: _onSelect,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.store), label: 'restaurants'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }

  int _getIndex() {
    final location = GoRouter.of(context).location;
    if (location.startsWith(AppRoutes.restaurants)) {
      return 0;
    } else if (location.startsWith(AppRoutes.profile)) {
      return 1;
    } else {
      return 0;
    }
  }

  void _onSelect(int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.restaurants);
        break;
      case 1:
        context.go(AppRoutes.profile);
        break;
    }
  }
}
