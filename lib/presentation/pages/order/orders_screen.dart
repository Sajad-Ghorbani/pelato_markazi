import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/presentation/controller/order/order_controller.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBarTitle: 'سفارشات',
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrderController>(
            builder: (_) {
              return Column(
                children: controller.orders.map((order) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: order.status == 'pending'
                          ? AppColors.yellowColor.withOpacity(0.7)
                          : order.status == 'completed'
                              ? AppColors.greenColor.withOpacity(0.7)
                              : const Color(0xFFFF0000).withOpacity(0.7),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        onTap: () {
                          Get.toNamed(Routes.orderViewScreen, arguments: order);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(
                                      order.salon!.images![0],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width - 130,
                                        child: Row(
                                          children: [
                                            Text(
                                              order.salon!.name!
                                                  .toPersianDigit(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: order.status ==
                                                            'canceled'
                                                        ? Colors.white
                                                        : null,
                                                  ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              controller.getOrderStatus(order.status!),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontFamily: 'Kalameh',
                                                    fontWeight: FontWeight.bold,
                                                    color: order.status ==
                                                            'canceled'
                                                        ? Colors.white
                                                        : null,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            '${order.orderDays.length} روز'
                                                .toPersianDigit(),
                                            style: TextStyle(
                                              color: order.status == 'canceled'
                                                  ? Colors.white
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          Text(
                                            '${order.orderHours} ساعت'
                                                .toPersianDigit(),
                                            style: TextStyle(
                                              color: order.status == 'canceled'
                                                  ? Colors.white
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (order.remainedTime != null &&
                                  order.remainedTime != 0) ...[
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                        'مدت زمان باقی مانده تا تکمیل رزرو:'),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${'${order.remainedTime! % 60} : '.toPersianDigit()}${'${order.remainedTime! ~/ 60}'.toPersianDigit()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          )),
    );
  }
}
