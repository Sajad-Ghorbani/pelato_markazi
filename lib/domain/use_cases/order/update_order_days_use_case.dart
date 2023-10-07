import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class UpdateOrderDaysUseCase {
  final OrderRepository _orderRepository;

  UpdateOrderDaysUseCase(this._orderRepository);

  Future<DataState<bool>> execute({
    required String orderId,
    required String token,
    required List<Map<String, String>> reserveDay,
    String? couponCode,
  }) async {
    return _orderRepository.updateOrderDays(
      orderId: orderId,
      token: token,
      reserveDay: reserveDay,
    );
  }
}
