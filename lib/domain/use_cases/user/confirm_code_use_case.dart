import 'package:get/get.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/repositories/user_repository.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmCodeUSeCase {
  final UserRepository userRepository;

  ConfirmCodeUSeCase(this.userRepository);

  Future<DataState<String>> execute(
      {required String confirmCode, required String phone}) async {
    print('----------------------------------------------------------');
    if (phone.isEmpty || confirmCode.isEmpty) {
      print('empty');
      return const DataFailed('فیلدها نباید خالی باشد');
    } //
    else if (!phone.isValidIranianMobileNumber()) {
      print('not valid');
      return const DataFailed('شماره تلفن وارد شده معتبر نمی باشد.');
    }
    var response = await userRepository.confirmCode(
        phone: phone, confirmCode: confirmCode);
    if (response.data == null) {
      print(response.error);
      return DataFailed(response.error!);
    } //
    else {
      String token = response.data!;
      SharedPreferences pref = Get.find<Services>().pref;
      await pref.setString('token', token);
      print('ok');
      return const DataSuccess('OK');
    }
  }
}
