import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class UpdateOrderStatusUseCase {
  final OrderRepository _orderRepository;

  UpdateOrderStatusUseCase(this._orderRepository);

  Future<DataState<bool>> execute({
    required String id,
    required String status,
    required String token,
  }) async {
    return _orderRepository.updateOrderStatus(
      id: id,
      status: status,
      token: token,
    );
  }
}
