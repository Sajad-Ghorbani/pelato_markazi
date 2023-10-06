import 'package:get/get.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/app/core/user_param.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/entities/user_entity.dart';
import 'package:pelato_markazi/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteProfileUseCase {
  final UserRepository userRepository;

  CompleteProfileUseCase(this.userRepository);

  Future<DataState<String>> execute(
      {required String token, required UserParams user}) async {
    if (user.name.isEmpty) {
      return const DataFailed('اسمت نباید خالی باشه');
    } //
    else if (user.familyName.isEmpty) {
      return const DataFailed('فامیلت نباید خالی باشه');
    } //
    else if (user.email != null && !user.email!.isEmail) {
      return const DataFailed('ایمیل وارد شده صحیح نیست');
    } //
    UserEntity userEntity = UserEntity(
      name: user.name,
      familyName: user.familyName,
      email: user.email,
      instagramPageAddress: user.instagramPageAddress,
      groupName: user.groupName,
    );
    var response =
        await userRepository.completeProfile(user: userEntity, token: token);
    if (response.data == null) {
      return DataFailed(response.error!);
    } //
    else {
      SharedPreferences pref = Get.find<Services>().pref;
      await pref.setBool('isLogin', true);
      return DataSuccess(response.data!);
    }
  }
}
