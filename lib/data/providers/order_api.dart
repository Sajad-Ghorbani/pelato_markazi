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
    // try {
    //   if (response.statusCode == 200) {
    //     List<OrderModel> orders = [];
    //     for (var item in response.data['orders']) {
    //       orders.add(OrderModel.fromJson(item));
    //     }
    //     OrderMetaData metaData =
    //         OrderMetaData.fromJson(response.data['metadata']);
    //     return (metaData, orders);
    //   } //
    //   return null;
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.message.toString());
    //   return null;
    // }
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
    // try {
    //
    //   if (response.statusCode == 200) {
    //     var order = OrderModel.fromJson(response.data['data']['order']);
    //     for (var item in response.data['data']['reserve_days']) {
    //       order.salon!.reservedTimes = [];
    //       order.salon!.reservedTimes!.add(ReserveModel.fromJson(item));
    //     }
    //     return order;
    //   } //
    //   return null;
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.message.toString());
    //   return null;
    // }
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
    // try {
    //   if (response.statusCode == 201) {
    //     return const DataSuccess(true);
    //   } //
    //   else if (response.statusCode == 404) {
    //     return const DataFailed('زمان های انتخاب شده قبلا رزرو شده اند.');
    //   }
    //   return DataFailed(response.data['errors'].toString());
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.response!.data['message'].toString());
    //   return DataFailed(e.message.toString());
    // }
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
    // try {
    //   if (response.statusCode == 200) {
    //     return const DataSuccess(true);
    //   } //
    //   else if (response.statusCode == 404) {
    //     return const DataFailed('زمان های انتخاب شده قبلا رزرو شده اند.');
    //   }
    //   return DataFailed(response.data['errors'].toString());
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.response!.data['message'].toString());
    //   return DataFailed(e.message.toString());
    // }
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
    // try {
    //   if (response.statusCode == 201) {
    //     return const DataSuccess(true);
    //   } //
    //   else if (response.statusCode == 404) {
    //     return const DataFailed('این کد تخفیف قبلا استفاده شده است.');
    //   }
    //   return DataFailed(response.data['errors'].toString());
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.response!.data['message'].toString());
    //   return DataFailed(e.message.toString());
    // }
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

    // try {
    //   if (response.statusCode == 200) {
    //     var coupon = Coupon.fromJson(response.data['data']);
    //     return coupon;
    //   } //
    //   return null;
    // } on DioException catch (e) {
    //   log(e.response!.statusCode.toString());
    //   log(e.message.toString());
    //   return null;
    // }
  }
}
