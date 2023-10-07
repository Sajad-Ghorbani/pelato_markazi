import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';

class SalonApi {
  Dio dio = Dio();
  String baseUrl = AppConstants.baseUrl;

  Future getAllSalon({required String token}) async {
    var response = await dio.get(
      '$baseUrl/salons',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future getSalon({required String id, required String token}) async {
    var response = await dio.get(
      '$baseUrl/salons/single/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        responseType: ResponseType.json,
      ),
    );
    return response;
  }
}
