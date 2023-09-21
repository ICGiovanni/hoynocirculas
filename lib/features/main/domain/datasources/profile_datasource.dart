abstract class ProfileDataSource {
  Future<String?> updateProfile(
      {required String id, required String? fullname, required String? email});
  Future<void> changePassword(String newPassword);
}