import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';
import 'package:pelato_markazi/domain/repositories/salon_repository.dart';

class GetAllSalonsUseCase {
  final SalonRepository _salonRepository;

  GetAllSalonsUseCase(this._salonRepository);

  Future<DataState<List<SalonEntity>>> execute({required String token}) async {
    return _salonRepository.getAllSalons(token: token);
  }
}
