import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/data/models/user_model.dart';
import 'package:pelato_markazi/data/providers/user_api.dart';
import 'package:pelato_markazi/domain/entities/user_entity.dart';
import 'package:pelato_markazi/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
  Future<DataState<String>> completeProfile(
      {required UserEntity user, required String token}) async {
    try {
      Response response = await userApi.completeProfile(
          user: User.fromEntity(user), token: token);
      if (response.statusCode == 200) {
        return DataSuccess(response.data['message']);
      } //
      else {
        return DataFailed(response.data['errors']);
      }
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data['errors'].toString());
      return DataFailed(e.response!.data['errors'].toString());
    }
  }

  @override
  Future<DataState<String>> confirmCode(
      {required String phone, required String confirmCode}) async {
    try {
      Response response =
          await userApi.confirmCode(phone: phone, confirmCode: confirmCode);
      if (response.statusCode == 200) {
        return DataSuccess(response.data['token']);
      } //
      else {
        log(response.data['errors'].toString());
        return DataFailed(response.data['errors']);
      }
    } //
    on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return const DataFailed('کاربری با شماره تماس وارد شده وجود ندارد');
        } //
        else if (e.response!.statusCode == 400) {
          return const DataFailed('کد فعالسازی صحیح نمی باشد');
        }
      }
      return DataFailed('${e.message}');
    }
  }
}
