import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/coupon_entity.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/entities/order_meta_data_entity.dart';

abstract interface class OrderRepository {
  Future<DataState<(OrderMetaDataEntity, List<OrderEntity>)?>> getAllOrder(
      {required String token, int page = 0});

  Future<DataState<OrderEntity>> getOrder(
      {required String token, required String id});

  Future<DataState<bool>> createOrder({
    required String salonId,
    required String token,
    String? couponCode,
    required List<Map<String, String>> reserveDay,
  });

  Future<DataState<bool>> updateOrderDays({
    required String orderId,
    required String token,
    required List<Map<String, String>> reserveDay,
  });

  Future<DataState<bool>> updateOrderStatus(
      {required String id, required String status, required String token});

  Future<DataState<CouponEntity>> getCoupon(
      {required String couponCode, required String token});
}
