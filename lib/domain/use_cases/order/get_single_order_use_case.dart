import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class GetSingleOrderUseCase{
  final OrderRepository _orderRepository;

  GetSingleOrderUseCase(this._orderRepository);

  Future<DataState<OrderEntity>> execute({required String id,required String token})async{
    return _orderRepository.getOrder(token: token, id: id);
  }
}