import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';
import 'package:pelato_markazi/domain/repositories/salon_repository.dart';

class GetSalonUseCase {
  final SalonRepository _salonRepository;

  GetSalonUseCase(this._salonRepository);

  Future<DataState<SalonEntity>> execute(
      {required String token, required String id}) async {
    return _salonRepository.getSalon(token: token, id: id);
  }
}
