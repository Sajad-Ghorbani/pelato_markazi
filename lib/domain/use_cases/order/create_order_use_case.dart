import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class CreateOrderUseCase {
  final OrderRepository _orderRepository;

  CreateOrderUseCase(this._orderRepository);

  Future<DataState<String>> execute({
    required String salonId,
    required String token,
    required List<Map<String, String>> reserveDay,
    String? couponCode,
  }) async {
    return _orderRepository.createOrder(
      salonId: salonId,
      token: token,
      reserveDay: reserveDay,
      couponCode: couponCode,
    );
  }
}
