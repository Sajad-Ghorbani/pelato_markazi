import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/app/features/salon/controller/salon_controller.dart';
import 'package:pelato_markazi/app/features/salon/widgets/help_label.dart';
import 'package:pelato_markazi/app/features/salon/widgets/salon_table_box.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class SingleSalonScreen extends StatelessWidget {
  const SingleSalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalonController>(builder: (controller) {
      return BaseWidget(
        appBarTitle: controller.salon.name!.toPersianDigit(),
        showLeading: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                  'از این قسمت روز و ساعت مورد نظرتو از بین مواردی که آزاد هستن، انتخاب کن'),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('هفته قبل'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('هفته بعد'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SalonTableBox(),
                  ...List.generate(7, (index) {
                    return SalonTableBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            index == 6
                                ? 'جمعه'
                                : '${index == 0 ? '' : index} شنبه'
                                    .toPersianDigit(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            controller.weekStart
                                .add(Duration(days: index))
                                .toPersianDate(twoDigits: false)
                                .substring(5),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Column(
                        children: controller.timeSlots.map((time) {
                          return SalonTableBox(
                            child: Center(child: Text(time.toPersianDigit())),
                          );
                        }).toList(),
                      ),
                      ...List.generate(controller.days.length, (index) {
                        return Column(
                          children: controller.days[index].map((item) {
                            return SalonTableBox(
                              onTap: item['status'] == 'free' ||
                                      item['status'] == 'selected'
                                  ? () {
                                      if (item['status'] == 'free') {
                                        item['status'] = 'selected';
                                      } //
                                      else {
                                        item['status'] = 'free';
                                      }
                                      controller.update();
                                    }
                                  : null,
                              status: item['status'],
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HelpLabelWidget(title: 'سفید: قابل رزرو'),
                  HelpLabelWidget(title: 'زرد: در حال رزرو'),
                  HelpLabelWidget(title: 'قرمز: تکمیل'),
                  HelpLabelWidget(title: 'سبز: انتخاب شما'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      'روز: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '5'.toPersianDigit(),
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
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                          ),
                    ),
                  ),
                  Text(
                    '25'.toPersianDigit(),
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
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '250,000 تومان'.toPersianDigit(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    'مبلغ کل: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '666,250,000 تومان'.toPersianDigit(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.checkoutScreen);
                },
                child: const Text('ادامه رزرو'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
