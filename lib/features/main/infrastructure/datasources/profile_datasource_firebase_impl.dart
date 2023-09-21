import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hoy_no_circulas/config/config.dart';
import 'package:hoy_no_circulas/features/main/domain/domain.dart';
import 'package:hoy_no_circulas/features/shared/services/key_values_storage_service_impl.dart';

class ProfileDataSourceFirebaseImpl extends ProfileDataSource {
  final dio = Dio(
    BaseOptions(receiveTimeout: const Duration(seconds: 5)),
  );

  final keyValueStorageService = KeyValueStorageServiceImpl();

  @override
  Future<void> changePassword(String newPassword) {
    throw UnimplementedError();
  }

  @override
  Future<String?> updateProfile(
      {required String id,
      required String? fullname,
      required String? email}) async {
    try {
      final token = await keyValueStorageService.getValue<String>('token');

      //final String url = '${Environment.firebaseApiUrl}/v1/accounts:update';
      // final response = await dio.post(
      //   url,
      //   data: jsonEncode(
      //     {
      //       'idToken': token,
      //       'email': email,
      //       'returnSecureToken': true,
      //     },
      //   ),
      //   queryParameters: {
      //     'key': Environment.firebaseApiKey,
      //   },
      // );

      if (fullname != null) {
        final Map<String, dynamic> userData = {
          'fullName': fullname,
        };

        final userResponse = await dio.patch(
          '${Environment.firebaseRestUrl}/users/$id.json',
          data: userData,
          queryParameters: {
            'auth': token,
          },
        );

        if (userResponse.statusCode == 200) {
          print('cambiado exitosamente');

          return null;
        } else {
          return "Error : ${userResponse.data}";
        }
      }
    } catch (e) {
      throw UnimplementedError();
    }
  }

  //OPERATION_NOT_ALLOWED : Please verify the new email before changing email

  Future<void> enviarCorreoVerificacion(
      String idToken, String nuevoCorreo) async {
    final String url = '${Environment.firebaseApiUrl}/v1/accounts:sendOobCode';

    try {
      final response = await dio.post(url,
          options: Options(contentType: 'application/json'),
          data: jsonEncode({
            'requestType': 'VERIFY_EMAIL',
            'idToken': idToken,
            'email': nuevoCorreo,
          }));

      if (response.statusCode == 200) {
        print('Correo de verificación enviado correctamente');
      } else {
        print('Error al enviar el correo de verificación: ${response.data}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  Future<void> verificarCorreo(String oobCode) async {
    final String url = '${Environment.firebaseApiUrl}/v1/accounts:update';

    try {
      final response = await dio.post(url,
          options: Options(contentType: 'application/json'),
          data: jsonEncode({
            'oobCode': oobCode,
            'requestType': 'VERIFY_EMAIL',
          }));

      if (response.statusCode == 200) {
        print('Correo electrónico verificado correctamente');
      } else {
        print('Error al verificar el correo electrónico: ${response.data}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }
}
