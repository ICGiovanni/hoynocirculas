import 'package:hoy_no_circulas/features/main/domain/domain.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource datasource;

  ProfileRepositoryImpl(this.datasource);

  @override
  Future<void> changePassword(String newPassword) {
    return datasource.changePassword(newPassword);
  }

  @override
  Future<String?> updateProfile(
      {required String id, required String? fullname, required String? email}) {
    return datasource.updateProfile(id: id, fullname: fullname, email: email);
  }
}
