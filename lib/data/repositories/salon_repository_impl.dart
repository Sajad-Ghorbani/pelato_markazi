import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/data/models/reserve_model.dart';
import 'package:pelato_markazi/data/models/salon_model.dart';
import 'package:pelato_markazi/data/providers/salon_api.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';
import 'package:pelato_markazi/domain/repositories/salon_repository.dart';

class SalonRepositoryImpl implements SalonRepository {
  final SalonApi salonApi;

  SalonRepositoryImpl(this.salonApi);

  @override
  Future<DataState<List<SalonEntity>>> getAllSalons(
      {required String token}) async {
    try {
      Response response = await salonApi.getAllSalon(token: token);
      if (response.statusCode == 200) {
        List<SalonEntity> salons = [];
        for (var item in response.data['data']) {
          salons.add(SalonModel.fromJson(item).toEntity());
        }
        return DataSuccess(salons);
      } //
      return const DataFailed('error');
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      return const DataFailed('error');
    }
  }

  @override
  Future<DataState<SalonEntity>> getSalon(
      {required String token, required String id}) async {
    try {
      Response response = await salonApi.getSalon(id: id, token: token);
      if (response.statusCode == 200) {
        SalonModel salon = SalonModel.fromJson(response.data['data']['salon']);
        for (var item in response.data['data']['salon_reserve_days']) {
          salon.reservedTimes = [];
          salon.reservedTimes!.add(ReserveModel.fromJson(item));
        }
        return DataSuccess(salon.toEntity());
      } //
      return const DataFailed('error');
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      return const DataFailed('error');
    }
  }
}
