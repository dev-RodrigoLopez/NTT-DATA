import 'package:flutter/material.dart';
import 'package:test_to_nnt/widgets/custom_testfield.dart';

class PassCardProfile extends StatelessWidget {
  const PassCardProfile({
    Key? key,
    required this.buttonSave,
    required this.currentTextfield,
    required this.newPassword,
    required this.confirmPassword,
  }) : super(key: key);

  final Widget buttonSave;
  final Customtextfield currentTextfield;
  final Customtextfield newPassword;
  final Customtextfield confirmPassword;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .35,
      height: size.height * .5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all( size.width * 0.01),
        child: Column(
          children: [
            const Text(
              'Cambiar Contrasenia',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            const Text(
              'La nueva contraseña debe tener al menos 8 caracteres, una letra mayúscula, un número y un carácter especial.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding:
                  const EdgeInsets.all(10),
              child: currentTextfield,
            ),
            Container(
              padding:
                  const EdgeInsets.all(10),
              child: newPassword,
            ),
            Container(
              padding:
                  const EdgeInsets.all(10),
              child: confirmPassword,
            ),
            const Spacer(),
            buttonSave,
          ],
        ),
      ),
    );
  }
}
