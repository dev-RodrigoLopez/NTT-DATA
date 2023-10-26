import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:test_to_nnt/change_pass_card.dart';
import 'package:test_to_nnt/utils/confirm_password.dart';
import 'package:test_to_nnt/utils/current_password.dart';
import 'package:test_to_nnt/utils/new_password.dart';
import 'package:test_to_nnt/widgets/custom_testfield.dart';
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
  
    ConfirmedPassword? confirmedPasswordGlobal = const ConfirmedPassword.pure();
    CurrentPassword? currentPasswordGlobal = const CurrentPassword.pure();
    NewPassword? newPasswordGlobal = const NewPassword.pure();
  
  void changeCurrentPassword(String currentPassword) {
    final currentPasswordFormResult = CurrentPassword.dirty(currentPassword);
    setState(() {
      currentPasswordGlobal = currentPasswordFormResult;
    });
  }

  void changeNewPassword(String newPassword) {
    final newPasswordForm = NewPassword.dirty(
      newPassword,
    );

    final confirmPass = ConfirmedPassword.dirty(
      original: newPasswordGlobal!,
      value: confirmedPasswordGlobal!.value,
    );

    setState(() {
      newPasswordGlobal = newPasswordForm;
      confirmedPasswordGlobal = confirmPass;
    });
  }

  void changeConfirmPassword(String confirmPassword) {
    final confirmPasswordForm = ConfirmedPassword.dirty(
      original: newPasswordGlobal!,
      value: confirmPassword,
    );
    setState(() {
      confirmedPasswordGlobal = confirmPasswordForm;
    });
  }

  void changePasswordFunction(){
    final status = validateForm();
    if( status.isValid ){
      log( 'Validaciones correctas ');
    } else {
      log( ' Error al comprobar los campos, valide su informacion ' );
    }
  }

  FormzStatus  validateForm() {
    return Formz.validate([
      confirmedPasswordGlobal!,
      currentPasswordGlobal!,
      newPasswordGlobal!
    ]);
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.black12,
          height: size.height * 1,
          width: size.width * 1,
          child: Padding(
            padding: EdgeInsets.all( size.height * .03 ),
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

                      changePasswordFunction();
                    },
                    textColor: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  confirmPassword: Customtextfield(
                    labelText: 'Confirmar contraseña',
                    error: confirmedPasswordGlobal!.invalid
                        ? 'Ambas contraseñas deben ser iguales'
                        : null,
                    onChanged: (string) {
                      changeConfirmPassword(string);
                    },
                  ),
                  currentTextfield: Customtextfield(
                    labelText: 'Contraseña anterior',
                    // error: true
                    error: currentPasswordGlobal!.invalid
                        ? 'Este campo es requerido'
                        : null,
                    onChanged: (string) {
                      changeCurrentPassword(string);
                    },
                  ),
                  newPassword: Customtextfield(
                    labelText: 'Contraseña nueva',
                    // error: true
                    error: newPasswordGlobal!.invalid
                        ? 'Contraseña invalidó'
                        : null,
                    onChanged: (string) {
                      changeNewPassword(string);
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
