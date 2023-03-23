import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/authenticator/presentation/login/login_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginViewModel = getIt<LoginViewModel>();
  final _emailTextEditCtrl = TextEditingController();
  final _passwordTextEditCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _loginViewModel.start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loginViewModel.sessionOutput.listen((event) {
        if (event is GenericSuccess) {
          context.go(AppRoutes.restaurants);
        } else if (event is GenericError) {
          showDialogMessage(context,
              title: 'Error al iniciar session', message: event.message);
        } else {
          showDialogMessage(context);
        }
      });
    });
  }

  @override
  void initState() {
    _bind();
    _emailTextEditCtrl.text = 'usercedtodo@gmail.com';
    _passwordTextEditCtrl.text = '12345678';
    super.initState();
  }

  @override
  void dispose() {
    _loginViewModel.finish();
    _emailTextEditCtrl.dispose();
    _passwordTextEditCtrl.dispose();
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
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordTextEditCtrl,
                  decoration: const InputDecoration(
                      label: Text('Password'), hintText: '********'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa una contraseña';
                    }
                    if (value.length < 8) {
                      return 'Por favor, ingresa una contraseña de 8 a más digitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _loginViewModel.createEmailSession(
                            _emailTextEditCtrl.text.trim(),
                            _passwordTextEditCtrl.text.trim());
                      }
                    },
                    child: const Text('Login')),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutes.recoverPassword);
                    },
                    child: const Text('recover password')),
                ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutes.register);
                    },
                    child: const Text('register')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
