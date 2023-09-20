import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/app/features/order/controller/order_controller.dart';
import 'package:pelato_markazi/app/models/order_model.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OrderViewScreen extends GetView<OrderController> {
  const OrderViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderModel order = Get.arguments;
    return GetBuilder<OrderController>(
      initState: (state) => controller.setOrderDatesList(order),
      builder: (controller) {
        return BaseWidget(
          appBarTitle: order.salon!.name!.toPersianDigit(),
          showLeading: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'تاریخ رزرو:',
                    ),
                    const SizedBox(width: 5),
                    Text(order.date!.toPersianDate()),
                    const Spacer(),
                    Text(
                      controller.getOrderStatus(order.status!),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Kalameh',
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                if (order.status == 'pending') ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${'${order.remainedTime! % 60} : '.toPersianDigit()}${'${order.remainedTime! ~/ 60}'.toPersianDigit()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                ...List.generate(controller.orderDateIndices.length, (index) {
                  int itemIndex = controller.orderDateIndices[index];
                  return Container(
                    width: Get.width - 20,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Wrap(
                      runSpacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 8),
                          decoration: const BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            order.salon!.reservesTime![itemIndex].day!
                                .toPersianDate(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Icon(
                          Iconsax.arrow_left_2,
                          size: 18,
                        ),
                        for (var item in order.salon!.reservesTime!) ...[
                          if (DateFormat.yMd().format(
                                  order.salon!.reservesTime![itemIndex].day!) ==
                              DateFormat.yMd().format(item.day!)) ...[
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.purpleAccent.withOpacity(0.4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 20),
                              child: Text(item.times!.toPersianDigit()),
                            ),
                          ],
                        ],
                      ],
                    ),
                  );
                }),
                Visibility(
                  visible: order.status == 'pending',
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('ویرایش'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
