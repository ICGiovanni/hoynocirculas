import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:hoy_no_circulas/features/auth/domain/domain.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/providers.dart';

import 'package:hoy_no_circulas/features/main/infrastructure/datasources/profile_datasource_firebase_impl.dart';
import 'package:hoy_no_circulas/features/main/infrastructure/repositories/profile_repository_impl.dart';
import 'package:hoy_no_circulas/features/shared/shared.dart';

final profileFormProvider =
    StateNotifierProvider.autoDispose<ProfileFormNotifier, ProfileFormState>(
        (ref) {
  final updateProfile =
      ProfileRepositoryImpl(ProfileDataSourceFirebaseImpl()).updateProfile;

  final user = ref.read(authProvider).user;

  return ProfileFormNotifier(updateProfile, user!);
});

typedef FunctionCallback = Future<String?> Function(
    {required String? email, required String? fullname, required String id});

class ProfileFormNotifier extends StateNotifier<ProfileFormState> {
  final FunctionCallback updateProfile;
  final User user;
  ProfileFormNotifier(this.updateProfile, this.user)
      : super(ProfileFormState()) {
    onFullNameChange(user.fullName);
    onEmailChange(user.email);
  }

  onFormSubmit() async {
    _toucheEveryField();
    if (!state.isValid) {
      return;
    }

    try {
      state = state.copyWith(isPosting: true);

      final response = await updateProfile(
        id: user.id,
        fullname:
            state.fullName.value == user.fullName ? null : state.fullName.value,
        email: state.email.value == user.email ? null : state.email.value,
      );

      if (response == null) {
        state = state.copyWith(
          success: true,
          isPosting: false,
        );
      } else {
        state = state.copyWith(
          errorMessage:
              'Se ha producido un error, por favor intente nuevamente.',
          isPosting: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Se ha producido un error, por favor intente nuevamente.',
        isPosting: false,
        success: false,
      );
    }
  }

  _toucheEveryField() {
    final email = Email.dirty(state.email.value);
    final fullName = TextInput.dirty(state.fullName.value);

    state = state.copyWith(
        email: email,
        fullName: fullName,
        isFormPosted: true,
        isValid: Formz.validate([email, fullName]));
  }

  void onEmailChange(String value) {
    final newEmail = Email.dirty(value);

    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.fullName]),
    );
  }

  onFullNameChange(String value) {
    final newFullName = TextInput.dirty(value);
    state = state.copyWith(
        fullName: newFullName,
        isValid: Formz.validate([newFullName, state.email]));
  }
}

// State

class ProfileFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final TextInput fullName;
  final String errorMessage;
  final bool success;

  ProfileFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.fullName = const TextInput.pure(),
    this.errorMessage = '',
    this.success = false,
  });

  ProfileFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    TextInput? fullName,
    String? errorMessage,
    bool? success,
  }) =>
      ProfileFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        errorMessage: errorMessage ?? this.errorMessage,
        success: success ?? this.success,
      );

  @override
  String toString() {
    return '''
        <= LoginFormState => 
        isPosting: $isPosting
        isFormPosted: $isFormPosted
        isValid: $isValid
        email: $email
        fullName: $fullName
        success: $success
 ''';
  }
}
