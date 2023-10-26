import 'package:formz/formz.dart';

enum CurrentPasswordValidationError { invalid }

class CurrentPassword
    extends FormzInput<String, CurrentPasswordValidationError> {
  const CurrentPassword.pure([String value = '']) : super.pure(value);
  const CurrentPassword.dirty([String value = '']) : super.dirty(value);

  @override
  CurrentPasswordValidationError? validator(String value) {
    if (value.isEmpty) return CurrentPasswordValidationError.invalid;
    return null;
  }
}
