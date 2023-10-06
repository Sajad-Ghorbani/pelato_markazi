import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/presentation/controller/home/home_controller.dart';
import 'package:pelato_markazi/presentation/pages/home/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return BaseWidget(
          appBarTitle: 'پلاتو مرکزی',
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/salon_1.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/salon_2.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/salon_3.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  endIndent: 40,
                  indent: 40,
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'برای دیدن زمان های آزاد هر سالن و رزرو کردن سالن روی اون کلیک کن',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ...controller.salonList.map((salon) {
                  return HomeCardWidget(
                    title: salon.name!,
                    imageAddress: salon.images![0],
                    features: salon.features!,
                    onTap: () {
                      controller.getData();
                      Get.toNamed(Routes.singleSalonScreen, arguments: salon);
                    },
                    area: salon.area!,
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
