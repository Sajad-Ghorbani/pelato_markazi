import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pelato_markazi/data/data.dart';
import 'package:pelato_markazi/domain/domain.dart';

class Services extends GetxService {
  late SharedPreferences pref;

  Future<Services> init() async {
    pref = await SharedPreferences.getInstance();

    ///inject api providers
    Get.put<UserApi>(UserApi());
    Get.put<OrderApi>(OrderApi());
    Get.put<SalonApi>(SalonApi());

    ///inject repositories
    Get.put<UserRepository>(UserRepositoryImpl(Get.find()));
    Get.put<OrderRepository>(OrderRepositoryImpl(Get.find()));
    Get.put<SalonRepository>(SalonRepositoryImpl(Get.find()));

    ///user use cases
    Get.put<CompleteProfileUseCase>(CompleteProfileUseCase(Get.find()));
    Get.put<ConfirmCodeUSeCase>(ConfirmCodeUSeCase(Get.find()));

    ///salon use cases
    Get.put<GetSalonUseCase>(GetSalonUseCase(Get.find()));
    Get.put<GetCouponUseCase>(GetCouponUseCase(Get.find()));
    Get.put<GetAllSalonsUseCase>(GetAllSalonsUseCase(Get.find()));

    ///order use cases
    Get.put<CreateOrderUseCase>(CreateOrderUseCase(Get.find()));
    Get.put<GetAllOrderUseCase>(GetAllOrderUseCase(Get.find()));
    Get.put<GetSingleOrderUseCase>(GetSingleOrderUseCase(Get.find()));
    Get.put<UpdateOrderDaysUseCase>(UpdateOrderDaysUseCase(Get.find()));
    Get.put<UpdateOrderStatusUseCase>(UpdateOrderStatusUseCase(Get.find()));

    return this;
  }
}
