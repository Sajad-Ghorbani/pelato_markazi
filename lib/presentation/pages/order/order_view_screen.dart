import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/presentation/controller/order/order_controller.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OrderViewScreen extends GetView<OrderController> {
  const OrderViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderEntity order = Get.arguments;
    return GetBuilder<OrderController>(
      builder: (controller) {
        return BaseWidget(
          appBarTitle: order.salon!.name!.toPersianDigit(),
          showLeading: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Hero(
                    tag: order.id!,
                    child: CachedNetworkImage(
                      imageUrl: AppConstants.imageUrl + order.salon!.images![0],
                      height: 200,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'تاریخ رزرو:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Text(order.orderDate!.toPersianDate()),
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
                ...List.generate(order.orderDays.length, (index) {
                  int itemIndex = order.orderDays[index];
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
                            order.salon!.reservedTimes![itemIndex].day!
                                .toPersianDate(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Icon(
                          Iconsax.arrow_left_2,
                          size: 18,
                        ),
                        for (var item in order.salon!.reservedTimes!) ...[
                          if (DateFormat.yMd().format(order
                                  .salon!.reservedTimes![itemIndex].day!) ==
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
                              child: Text(item.hours!.toPersianDigit()),
                            ),
                          ],
                        ],
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'روز: ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${order.orderDays.length}'.toPersianDigit(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'ساعت: ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${order.orderHours}'.toPersianDigit(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'تعرفه: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${'${order.salon!.rentCost!}'.seRagham()} تومان'
                          .toPersianDigit(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      'تخفیف: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${'${order.appliedCouponDiscount! * order.orderHours}'.seRagham().toPersianDigit()} تومان',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مبلغ کل: ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${'${order.totalCount}'.seRagham().toPersianDigit()} تومان',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: order.status == 'pending',
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.singleSalonScreen,
                          arguments: order.salon!.id,
                          parameters: {
                            'isUpdate': 'true',
                            'orderId': order.id!,
                          });
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
