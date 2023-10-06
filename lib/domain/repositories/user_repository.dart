import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/domain/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<DataState<String>> confirmCode(
      {required String phone, required String confirmCode});

  Future<DataState<String>> completeProfile(
      {required UserEntity user, required String token});
}
