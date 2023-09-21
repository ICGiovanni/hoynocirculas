import 'package:formz/formz.dart';

enum TextInputValidationError { empty }

class TextInput extends FormzInput<String, TextInputValidationError> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TextInputValidationError.empty)
      return 'El campo es requerido';

    return null;
  }

  @override
  TextInputValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TextInputValidationError.empty;
  }
}
