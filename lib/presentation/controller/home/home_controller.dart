import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/core/resources/data_state.dart';
import 'package:pelato_markazi/data/models/order_meta_data.dart';
import 'package:pelato_markazi/data/models/order_model.dart';
import 'package:pelato_markazi/data/models/salon_model.dart';
import 'package:pelato_markazi/data/models/user_model.dart';
import 'package:pelato_markazi/data/providers/order_api.dart';
import 'package:pelato_markazi/data/providers/salon_api.dart';
import 'package:pelato_markazi/data/providers/user_api.dart';
import 'package:pelato_markazi/presentation/pages/home/about_us_screen.dart';
import 'package:pelato_markazi/presentation/pages/home/home_screen.dart';
import 'package:pelato_markazi/presentation/pages/order/orders_screen.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  List<Widget> widgets = const [
    HomeScreen(),
    OrdersScreen(),
    AboutUsScreen(),
  ];

  List<SalonModel> salonList = salons;

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  void getData() async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MTEyYWE1OGFiZDVlODg2NjkyNDk3ZSIsImlhdCI6MTY5NjM1NzI1NCwiZXhwIjoxNzI3OTE0ODU0fQ.e6dVSSpcgJ7QcJHMfqWJDlWAdoemSBAqdMBvVNhwO9I';
    // await UserApi()
    //     .confirmCode(phone: '09351679934', confirmCode: '2087')
    //     .then((confirm) async {
    //   print(confirm);
    // });
    // if (confirm != null) {
    //   token = confirm;
    // }
    // if (token != '-1') {
    print('--------------------------------------');
    String? complete = await UserApi().completeProfile(
      user: User(
        name: 'sajad',
        familyName: 'ghorbani',
        email: 'sajad.2012.gh@gmail.com',
        instagramPageAddress: 'sajad_ghorbani10',
        groupName: ' ',
      ),
      token: token,
    );
    print(complete);
    List<SalonModel>? allSalon = await SalonApi().getAllSalon(token: token);
    print(allSalon);
    SalonModel? salon =
        await SalonApi().getSalon(id: '651132488abd5e88669249ba', token: token);
    print(salon);
    DataState<bool> crOrder = await OrderApi().createOrder(
      salonId: '651132488abd5e88669249ba',
      token: token,
      // couponCode: 'f2h6a8x6h9',
      reserveDay: [
        {
          "day": '2023-10-05 12:00:00.000',
          "hours": "9-10"
        },
        {
          "day": '2023-10-05 12:00:00.000',
          "hours": "10-11"
        },
        {
          "day": '2023-10-05 12:00:00.000',
          "hours": "11-12"
        },
        {
          "day": '2023-10-05 12:00:00.000',
          "hours": "12-13"
        }
      ],
    );
    print(crOrder.data ?? crOrder.error);
    (OrderMetaData, List<OrderModel>)? allOrder =
        await OrderApi().getAllOrder(token: token);
    print(allOrder);
    OrderModel? order =
        await OrderApi().getOrder(id: allOrder!.$2[0].id!, token: token);
    print(order);
  }
// }
}
