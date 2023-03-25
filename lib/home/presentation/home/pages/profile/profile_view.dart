import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as models;
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/home/presentation/home/pages/profile/profile_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';
import 'package:user_cedtodo/startapp/presentation/resources/widgets/circle_shimmer.dart';
import 'package:user_cedtodo/startapp/presentation/resources/widgets/rectangle_shimmer.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _profileViewModel = getIt<ProfileViewModel>();

  _bind() {
    _profileViewModel.start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileViewModel.genericResultOutput.listen((event) {
        if (event is GenericSuccess) {
          context.go(AppRoutes.splash);
        } else if (event is GenericError) {
          showDialogMessage(context,
              title: 'Ocurrio un error al cerrar la session',
              message: event.message);
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
    _profileViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: StreamBuilder<Uint8List?>(
                    stream: _profileViewModel.initialsOutput,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        final uint8List = snapshot.data;
                        return uint8List != null
                            ? SizedBox(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: ClipOval(
                                        child: Image.memory(uint8List))))
                            : const CircleShimmer();
                      } else if (snapshot.hasError) {
                        return const SizedBox(
                            width: 100, height: 100, child: CircleAvatar());
                      }
                      return const CircleShimmer();
                    }),
              ),
              StreamBuilder<models.Account?>(
                  stream: _profileViewModel.accountOutput,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final account = snapshot.data;
                      return account != null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 20),
                                Text(account.name),
                                const SizedBox(height: 10),
                                Text(account.email),
                                const SizedBox(height: 10),
                                Text(account.phone),
                              ],
                            )
                          : const SizedBox();
                    } else if (snapshot.hasError) {
                      return const SizedBox();
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(height: 20),
                        RectangleShimmer(
                          textPreview: 'Rodolfo Samuel Gavilan Muñoz',
                        ),
                        SizedBox(height: 10),
                        RectangleShimmer(
                          textPreview: 'rodolfogavilanmun@gmail.com',
                        ),
                        SizedBox(height: 10),
                        RectangleShimmer(
                          textPreview: '+959241022',
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    _profileViewModel.deleteSession();
                  },
                  child: const Text('Cerrar session'))
            ],
          ),
        ),
      ),
    );
  }
}
