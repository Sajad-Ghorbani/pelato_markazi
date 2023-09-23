import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/features/home/widgets/salon_feature_widget.dart';
import 'package:pelato_markazi/app/models/feature_model.dart';
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
  final List<FeatureModel> features;
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
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(15)),
                    child: Image.asset(
                      imageAddress,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toPersianDigit(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '$area متر'.toPersianDigit(),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: width * 0.55,
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
      ),
    );
  }
}
