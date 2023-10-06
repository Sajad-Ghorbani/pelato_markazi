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
    // try {
    //   if (response.statusCode == 200) {
    //     List<SalonModel> salons = [];
    //     for (var item in response.data['data']) {
    //       salons.add(SalonModel.fromJson(item));
    //     }
    //     return salons;
    //   } //
    //   return null;
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.message.toString());
    //   return null;
    // }
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
    // try {
    //
    //   if (response.statusCode == 200) {
    //     SalonModel salon = SalonModel.fromJson(response.data['data']['salon']);
    //     for (var item in response.data['data']['salon_reserve_days']) {
    //       salon.reservedTimes = [];
    //       salon.reservedTimes!.add(ReserveModel.fromJson(item));
    //     }
    //     return salon;
    //   } //
    //   return null;
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.message.toString());
    //   return null;
    // }
  }
}
