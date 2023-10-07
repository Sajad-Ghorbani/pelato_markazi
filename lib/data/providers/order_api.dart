import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';

class OrderApi {
  Dio dio = Dio();
  String baseUrl = AppConstants.baseUrl;

  Future getAllOrder({required String token, int? page}) async {
    var response = await dio.get(
      '$baseUrl/orders?page=${page ?? 0}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future getOrder({required String id, required String token}) async {
    var response = await dio.get(
      '$baseUrl/orders/single/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future createOrder({
    required String salonId,
    required String token,
    String? couponCode,
    required List<Map<String, String>> reserveDay,
  }) async {
    var response = await dio.post(
      '$baseUrl/orders/create-order/',
      data: json.encode({
        'salon_id': salonId,
        'reserve_days': reserveDay,
        if (couponCode != null) 'coupon_code': couponCode,
      }),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future updateOrderDays({
    required String orderId,
    required String token,
    required List<Map<String, String>> reserveDay,
  }) async {
    var response = await dio.post(
      '$baseUrl/orders/update-days/',
      data: json.encode({
        'order_id': orderId,
        'days': reserveDay,
      }),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future updateOrderStatus(
      String id, String status, String token) async {
      var response = await dio.post(
        '$baseUrl/orders/update-status/',
        data: json.encode({
          'id': id,
          'status': status,
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
      return response;
  }

  Future getCoupon({required String couponCode, required String token}) async {
    var response = await dio.get(
      '$baseUrl/coupons/single/$couponCode',
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
