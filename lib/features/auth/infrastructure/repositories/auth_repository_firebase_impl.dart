import 'package:hoy_no_circulas/features/auth/domain/domain.dart';

class AuthRepositoryFirebaseImpl extends AuthRepository {
  final AuthDataSource datasource;

  AuthRepositoryFirebaseImpl(this.datasource);
  @override
  Future<User> checkAuthStatus(String token) {
    return datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return datasource.register(email, password, fullName);
  }
}
