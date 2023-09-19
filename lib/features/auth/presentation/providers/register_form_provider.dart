import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:hoy_no_circulas/features/shared/infrastructure/inputs/confirm_password.dart';
import 'package:hoy_no_circulas/features/shared/shared.dart';
import 'providers.dart';

// 3 Consumir provider StateNotifierProvider . se consume desde afuera

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;

  return RegisterFormNotifier(registerUserCallback);
});

// 2 implementar el notifier StateNotifier

typedef FunctionCallback = Future Function(
    String email, String password, String fullName);

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final FunctionCallback register;
  RegisterFormNotifier(this.register) : super(RegisterFormState());

  onFormSubmit() async {
    _toucheEveryField();
    if (!state.isValid) {
      return;
    }

    state = state.copyWith(isPosting: true);

    await register(
        state.email.value, state.password.value, state.fullName.value);

    state = state.copyWith(isPosting: false);
  }

  _toucheEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final confirmPassword = ConfirmPassword.dirty(
        state.confirmPassword.value, state.password.value);
    final fullName = FullName.dirty(state.fullName.value);

    state = state.copyWith(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        fullName: fullName,
        isFormPosted: true,
        isValid: Formz.validate([fullName, email, password, confirmPassword]));
  }

  onFullNameChange(String value) {
    final newFullName = FullName.dirty(value);

    state = state.copyWith(
      fullName: newFullName,
      isValid: Formz.validate(
          [newFullName, state.email, state.password, state.confirmPassword]),
    );
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);

    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate(
          [newEmail, state.fullName, state.password, state.confirmPassword]),
    );
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate(
            [newPassword, state.email, state.fullName, state.confirmPassword]));
  }

  onConfirmPasswordChange(String value) {
    final newConfirmPassword =
        ConfirmPassword.dirty(value, state.password.value);
    state = state.copyWith(
        confirmPassword: newConfirmPassword,
        isValid: Formz.validate(
            [newConfirmPassword, state.email, state.fullName, state.password]));
  }
}

// 1 Crear el estado

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FullName fullName;

  RegisterFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(""),
    this.fullName = const FullName.pure(),
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    FullName? fullName,
  }) =>
      RegisterFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        fullName: fullName ?? this.fullName,
      );

  @override
  String toString() {
    return '''
        <= RegisterFormState => 
        isPosting: $isPosting
        isFormPosted: $isFormPosted
        isValid: $isValid
        email: $email
        password: $password
        confirmPassword: $confirmPassword
        fullName: $fullName
 ''';
  }
}
