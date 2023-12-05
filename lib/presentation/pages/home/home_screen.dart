import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';
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
          child: controller.salonList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CarouselSlider(
                        items: controller.salonImages.map((image) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: CachedNetworkImage(
                              imageUrl: AppConstants.imageUrl + image,
                              fit: BoxFit.cover,
                              width: MediaQuery.sizeOf(context).width,
                            ),
                          );
                        }).toList(),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                            Get.toNamed(
                              Routes.singleSalonScreen,
                              arguments: salon.id,
                            );
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
