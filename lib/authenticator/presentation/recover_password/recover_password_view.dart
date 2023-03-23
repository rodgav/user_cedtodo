import 'package:flutter/material.dart';
import 'package:user_cedtodo/authenticator/presentation/recover_password/recover_password_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class RecoverPasswordView extends StatefulWidget {
  const RecoverPasswordView({Key? key}) : super(key: key);

  @override
  State<RecoverPasswordView> createState() => _RecoverPasswordViewState();
}

class _RecoverPasswordViewState extends State<RecoverPasswordView> {
  final _recoverPasswordViewModel = getIt<RecoverPasswordViewModel>();
  final _emailTextEditCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _recoverPasswordViewModel.start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recoverPasswordViewModel.recoverPasswordOutput.listen((event) {
        if (event is GenericSuccess) {
          showDialogMessage(context,
              title: 'Recuperación en progreso',
              message:
                  'Te enviamos un correo ingresa a la URL para recuperar tu contraseña');
        } else if (event is GenericError) {
          showDialogMessage(context,
              title: 'Error al recuperar password', message: event.message);
        } else {
          showDialogMessage(context);
        }
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _recoverPasswordViewModel.finish();
    _emailTextEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: FlutterLogo(),
                ),
                TextFormField(
                  controller: _emailTextEditCtrl,
                  decoration: const InputDecoration(
                      label: Text('Email'), hintText: 'email@organizacion.com'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un correo electrónico';
                    }

                    // Expresión regular para validar un correo electrónico
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (!emailRegex.hasMatch(value)) {
                      return 'Por favor, ingresa un correo electrónico válido';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _recoverPasswordViewModel
                            .recover(_emailTextEditCtrl.text.trim());
                      }
                    },
                    child: const Text('Recover')),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
