import 'package:formz/formz.dart';

enum NewPasswordValidationError { invalid }

class NewPassword extends FormzInput<String, NewPasswordValidationError> {
  const NewPassword.pure([String value = '']) : super.pure(value);
  const NewPassword.dirty([String value = '']) : super.dirty(value);

  static final RegExp _passwordRegExp =
      RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,15}$');
  @override
  NewPasswordValidationError? validator(String value) {
    if (!_passwordRegExp.hasMatch(value) || value.isEmpty || value == '') {
      return NewPasswordValidationError.invalid;
    } else {
      return null;
    }
  }
}
