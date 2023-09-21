import 'package:dio/dio.dart';
import 'package:hoy_no_circulas/config/config.dart';
import 'package:hoy_no_circulas/features/auth/domain/datasources/auth_datasource.dart';
import 'package:hoy_no_circulas/features/auth/domain/entities/user.dart';
import 'package:hoy_no_circulas/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceFirebaseImpl extends AuthDataSource {
  final dio = Dio();
  // Establece un tiempo de espera de 5 segundos

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=${Environment.firebaseApiUrl}',
        options: Options(
          headers: {'Autorization': 'Bearer $token'},
        ),
      );

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('token incorrecto');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '${Environment.firebaseApiUrl}/v1/accounts:signInWithPassword',
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
        queryParameters: {'key': Environment.firebaseApiKey},
      );

      final Map<String, dynamic> data = response.data;

      final String idUser = response.data['localId'];

      final userResponse =
          await dio.get('${Environment.firebaseRestUrl}/users/$idUser.json');

      data.addEntries(userResponse.data.entries);

      final User user = UserMapper.userJsonToEntity(data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Acceso no autorizado');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexion a internet');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) async {
    try {
      print(Environment.firebaseApiUrl);
      final response = await dio.post(
        '${Environment.firebaseApiUrl}/v1/accounts:signUp',
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
        queryParameters: {'key': Environment.firebaseApiKey},
      );

      final Map<String, dynamic> data = response.data;

      final String idUser = response.data['localId'];
      final String token = response.data['idToken'];

      final Map<String, dynamic> userData = {
        'fullName': fullName,
      };

      final userResponse = await dio.patch(
        '${Environment.firebaseRestUrl}/users/$idUser.json',
        data: userData,
        queryParameters: {
          'auth': token,
        },
      );

      data.addEntries(userResponse.data.entries);
      final User user = UserMapper.userJsonToEntity(data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(e.response?.data['message'] ?? 'Bad Request');
      }
      if (e.response?.statusCode == 401) {
        throw CustomError(e.response?.data['message'] ?? 'Unauthorized');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexion a internet');
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
