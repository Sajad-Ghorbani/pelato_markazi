import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';

abstract interface class SalonRepository {
  Future<DataState<List<SalonEntity>>> getAllSalons({required String token});

  Future<DataState<SalonEntity>> getSalon(
      {required String token, required String id});
}
