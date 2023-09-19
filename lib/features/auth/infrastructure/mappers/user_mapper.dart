import 'package:hoy_no_circulas/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['localId'],
        email: json['email'],
        fullName: json['fullName'],
        token: json['idToken'],
      );
}
