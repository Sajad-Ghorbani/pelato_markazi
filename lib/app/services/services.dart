import 'dart:async';

import 'package:get/get.dart';
import 'package:pelato_markazi/data/providers/order_api.dart';
import 'package:pelato_markazi/data/providers/salon_api.dart';
import 'package:pelato_markazi/data/providers/user_api.dart';
import 'package:pelato_markazi/data/repositories/order_repository_impl.dart';
import 'package:pelato_markazi/data/repositories/salon_repository_impl.dart';
import 'package:pelato_markazi/data/repositories/user_repository_impl.dart';
import 'package:pelato_markazi/domain/repositories/order_repository.dart';
import 'package:pelato_markazi/domain/repositories/salon_repository.dart';
import 'package:pelato_markazi/domain/repositories/user_repository.dart';
import 'package:pelato_markazi/domain/use_cases/order/create_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/get_all_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/get_single_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/update_order_days_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/update_order_status_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_all_salon_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_coupon_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_salon_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/user/complete_profile_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/user/confirm_code_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
