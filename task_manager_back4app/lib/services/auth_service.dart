import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthService {
  Future<bool> register(String email, String password) async {
    final user = ParseUser(email, password, email)
      ..set('role', 'student'); // optional
    final response = await user.signUp();
    return response.success;
  }

  Future<bool> login(String email, String password) async {
    final user = ParseUser(email, password, email);
    final response = await user.login();
    return response.success;
  }

  Future<void> logout() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user != null) {
      await user.logout();
    }
  }

  Future<bool> isLoggedIn() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    return user != null;
  }

  Future<ParseUser?> getCurrentUser() async {
    return await ParseUser.currentUser() as ParseUser?;
  }
}
