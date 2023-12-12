import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';
import 'package:pelato_markazi/domain/entities/feature_entity.dart';
import 'package:pelato_markazi/presentation/pages/home/widgets/salon_feature_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeCardWidget extends StatefulWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.images,
    required this.features,
    required this.onTap,
    required this.area,
  });

  final String title;
  final List<String> images;
  final List<FeatureEntity> features;
  final VoidCallback onTap;
  final int area;

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: const Color(0xff18cdb4).withOpacity(0.5),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: widget.onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: SizedBox(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    children: widget.images.map((imageAddress) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: CachedNetworkImage(
                            imageUrl: '${AppConstants.imageUrl}$imageAddress',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                            height: 200,
                            width: width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: currentIndex == index
                          ? AppColors.grayColor
                          : AppColors.blueGrayColor,
                    ),
                    width: currentIndex == index ? 8 : 20,
                    height: 8,
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toPersianDigit(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'متراژ: ${widget.area} متر مربع'.toPersianDigit(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: width,
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: widget.features.map((item) {
                          return SalonFeatureWidget(title: item.description!);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
