import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/core/utils/app_constants.dart';
import 'package:pelato_markazi/domain/entities/feature_entity.dart';
import 'package:pelato_markazi/presentation/pages/home/widgets/salon_feature_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.imageAddress,
    required this.features,
    required this.onTap,
    required this.area,
  });

  final String title;
  final String imageAddress;
  final List<FeatureEntity> features;
  final VoidCallback onTap;
  final int area;

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
          onTap: onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15)),
                child: CachedNetworkImage(
                  imageUrl: '${AppConstants.imageUrl}$imageAddress',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                  height: 200,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toPersianDigit(),
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'متراژ: $area متر مربع'.toPersianDigit(),
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: width,
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: features.map((item) {
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
