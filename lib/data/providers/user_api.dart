import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';
import 'package:pelato_markazi/data/models/user_model.dart';

class UserApi {
  Dio dio = Dio();
  String baseUrl = AppConstants.baseUrl;

  Future confirmCode(
      {required String phone, required String confirmCode}) async {
    var response = await dio.post(
      '$baseUrl/auth/confirm-code/',
      data: {'phone': phone, 'confirm_code': confirmCode},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return response;
  }

  Future completeProfile({required User user, required String token}) async {
    var response = await dio.post(
      '$baseUrl/user/complete-profile/',
      data: user.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
