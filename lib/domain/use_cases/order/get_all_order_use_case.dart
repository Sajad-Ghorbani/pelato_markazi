import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/entities/order_meta_data_entity.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';

class GetAllOrderUseCase {
  final OrderRepository _orderRepository;

  GetAllOrderUseCase(this._orderRepository);

  Future<DataState<(OrderMetaDataEntity, List<OrderEntity>)>> execute(
      {required String token,int page = 0}) async {
    return _orderRepository.getAllOrder(token: token,page: page);
  }
}
