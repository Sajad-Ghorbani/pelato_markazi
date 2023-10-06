import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/data/models/coupon_model.dart';
import 'package:pelato_markazi/data/models/order_meta_data.dart';
import 'package:pelato_markazi/data/models/order_model.dart';
import 'package:pelato_markazi/data/models/reserve_model.dart';
import 'package:pelato_markazi/data/providers/order_api.dart';
import 'package:pelato_markazi/domain/entities/coupon_entity.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/entities/order_meta_data_entity.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApi orderApi;

  OrderRepositoryImpl(this.orderApi);

  @override
  Future<DataState<bool>> createOrder(
      {required String salonId,
      required String token,
      String? couponCode,
      required List<Map<String, String>> reserveDay}) async {
    try {
      Response response = await orderApi.createOrder(
          salonId: salonId, token: token, reserveDay: reserveDay);
      if (response.statusCode == 201) {
        return const DataSuccess(true);
      } //
      else if (response.statusCode == 404) {
        return const DataFailed('زمان های انتخاب شده قبلا رزرو شده اند.');
      }
      return DataFailed(response.data['errors'].toString());
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data['message'].toString());
      return DataFailed(e.message.toString());
    }
  }

  @override
  Future<DataState<(OrderMetaDataEntity, List<OrderEntity>)>> getAllOrder(
      {required String token, int page = 0}) async {
    Response response = await orderApi.getAllOrder(token: token, page: page);
    try {
      if (response.statusCode == 200) {
        List<OrderEntity> orders = [];
        for (var item in response.data['orders']) {
          orders.add(OrderModel.fromJson(item).toEntity());
        }
        OrderMetaData metaData =
            OrderMetaData.fromJson(response.data['metadata']);
        return DataSuccess((metaData.toEntity(), orders));
      } //
      return const DataFailed('خطا...');
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<CouponEntity>> getCoupon(
      {required String couponCode, required String token}) async {
    try {
      Response response =
          await orderApi.getCoupon(couponCode: couponCode, token: token);
      if (response.statusCode == 200) {
        var coupon = Coupon.fromJson(response.data['data']);
        return DataSuccess(coupon.toEntity());
      } //
      return const DataFailed('');
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      return const DataFailed('error');
    }
  }

  @override
  Future<DataState<OrderEntity>> getOrder(
      {required String token, required String id}) async {
    try {
      Response response = await orderApi.getOrder(id: id, token: token);
      if (response.statusCode == 200) {
        var order = OrderModel.fromJson(response.data['data']['order']);
        for (var item in response.data['data']['reserve_days']) {
          order.salon!.reservedTimes = [];
          order.salon!.reservedTimes!.add(ReserveModel.fromJson(item));
        }
        return DataSuccess(order.toEntity());
      } //
      return const DataFailed('error');
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      return const DataFailed('error');
    }
  }

  @override
  Future<DataState<bool>> updateOrderDays(
      {required String orderId,
      required String token,
      required List<Map<String, String>> reserveDay}) async {
    try {
      Response response = await orderApi.updateOrderDays(
          orderId: orderId, token: token, reserveDay: reserveDay);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } //
      else if (response.statusCode == 404) {
        return const DataFailed('زمان های انتخاب شده قبلا رزرو شده اند.');
      }
      return DataFailed(response.data['errors'].toString());
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data['message'].toString());
      return DataFailed(e.message.toString());
    }
  }

  @override
  Future<DataState<bool>> updateOrderStatus(
      {required String id,
      required String status,
      required String token}) async {
    try {
      Response response = await orderApi.updateOrderStatus(id, status, token);
      if (response.statusCode == 201) {
        return const DataSuccess(true);
      } //
      else if (response.statusCode == 400) {
        return const DataFailed('این کد تخفیف قبلا استفاده شده است.');
      }
      return DataFailed(response.data['errors'].toString());
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data['message'].toString());
      return DataFailed(e.message.toString());
    }
  }
}
