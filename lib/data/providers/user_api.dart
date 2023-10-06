import 'dart:developer';

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
    // try {
    //   if (response.statusCode == 200) {
    //     return response.data['token'];
    //   } //
    //   else {
    //     log(response.data['errors'].toString());
    //     return null;
    //   }
    // } //
    // on DioException catch (e) {
    //   return e.message;
    // }
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
    // try {
    //   if (response.statusCode == 200) {
    //     return response.data['message'];
    //   } //
    //   else {
    //     return null;
    //   }
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //     log(e.response!.data['errors'].toString());
    //   return e.message;
    // }
  }
}
