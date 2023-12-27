import 'package:dio/dio.dart';
import 'package:todo_api/models/user.dart';
import 'package:todo_api/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    late String token;
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response response =
            await Client.dio.post("/signup", data: user.toJson());
        return token = response.data["token"];
      } else
        return "";
    } catch (e) {
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    late String token;

    try {
      final Response response =
          await Client.dio.post("/signin", data: user.toJson());
      return token = response.data["token"];
    } catch (e) {
      throw e.toString();
    }
  }
}
