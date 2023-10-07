import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/coupon_entity.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class GetCouponUseCase {
  final OrderRepository _orderRepository;

  GetCouponUseCase(this._orderRepository);

  Future<DataState<CouponEntity>> execute(
      {required String couponCode, required String token}) async {
    return _orderRepository.getCoupon(couponCode: couponCode, token: token);
  }
}
