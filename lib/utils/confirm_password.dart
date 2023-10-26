import 'package:formz/formz.dart';
import 'package:test_to_nnt/utils/new_password.dart';

enum ConfirmedPasswordValidationError { invalid }

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  const ConfirmedPassword.pure()
      : original = const NewPassword.pure(),
        super.pure('');
  const ConfirmedPassword.dirty({required this.original, String value = ''})
      : super.dirty(value);

  final NewPassword original;

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    if (original.value != value) {
      return ConfirmedPasswordValidationError.invalid;
    }
    return null;
  }
}
