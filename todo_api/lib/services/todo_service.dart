import 'package:dio/dio.dart';

// make a model class that takes a dart that was converted from JSON
class TodoService {
  // 1- Make a server URL as a string to reuse
  final String serverUrl = "https://calm-plum-jaguar-tutu.cyclic.app/todos";
  // 2- Make the dio instance ad make it private
  final _dio = Dio();

  // 3- Get the data from the server with try and catch using dio.get and give it the URL
  // the response value is of type future so it needs async and await
  // using the try and catch with future specially
  Future<Response> getTodoList() async {
    try {
      Response<dynamic> responseValue =
          await _dio.get(serverUrl); // can be given a type Response or final
      if (responseValue.statusCode == 200) {
        List list = responseValue.data['data'];
      }
      return responseValue;
    } catch (e) {
      throw e.toString();
    }
  }
}
