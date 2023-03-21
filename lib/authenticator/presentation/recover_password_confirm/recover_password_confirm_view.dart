import 'package:flutter/material.dart';

class RecoverPasswordConfirmView extends StatefulWidget {
  const RecoverPasswordConfirmView({Key? key}) : super(key: key);

  @override
  State<RecoverPasswordConfirmView> createState() =>
      _RecoverPasswordConfirmViewState();
}

class _RecoverPasswordConfirmViewState
    extends State<RecoverPasswordConfirmView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('recover password confirm'),
      ),
    );
  }
}
