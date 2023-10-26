import 'package:flutter/material.dart';
import 'package:test_to_nnt/change_pass_card.dart';
import 'package:test_to_nnt/widgets/global_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.all( size.height * .05 ),
            child: Column(
              children: [
                PassCardProfile(
                  buttonSave: BotonCustom(
                    textButton: 'Guardar',
                    onTap: () async {
                      final currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      // TODO(RODRIGO): Validar este metodo
                      // await _changeCubit.changePasswordFunction(
                      //   isRequired: widget.changePassRequired!,
                      //   l10n: l10n,
                      // );
                    },
                    textColor: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  confirmPassword: Customtextfield(
                    labelText: l10n.confirmPassProfile,
                    error: state.confirmedPassword!.invalid
                        ? l10n.confirmMessageError
                        : null,
                    onChanged: (string) {
                      _changeCubit.changeConfirmPassword(string);
                    },
                  ),
                  currentTextfield: Customtextfield(
                    labelText: (widget.changePassRequired ==
                            RequiredChangePass.nonRequired)
                        ? l10n.currentPassProfile
                        : l10n.temporaryPassHint,
                    error: state.currentPassword!.invalid
                        ? l10n.requiredMessageError
                        : null,
                    onChanged: (string) {
                      _changeCubit.changeCurrentPassword(string);
                    },
                  ),
                  newPassword: Customtextfield(
                    labelText: l10n.newPassProfile,
                    error: state.newPassword!.invalid
                        ? l10n.passwordInvalid
                        : null,
                    onChanged: (string) {
                      _changeCubit.changeNewPassword(string);
                    },
                  ),
                ),
              ]
            ),
          ),
          
        ),
      ),
    );
  }
}
