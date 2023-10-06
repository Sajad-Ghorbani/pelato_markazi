import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:pelato_markazi/app/config/theme/app_colors.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBarTitle: 'درباره ما',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'از اینکه پلاتو مرکزی رو انتخاب کردین سپاسگزاریم افتخار ما همراهی با حرفه ای هاست',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'پلاتو مرکزی ۳ تا سالن داره که از بهترین و استانداردترین سالنهای تمرین با همه امکانات مورد نیاز به حساب میان.',
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Iconsax.arrow_left,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text('دو سالن ۶۰ متری'),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(
                  Iconsax.arrow_left,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text('یک سالن ۸۰ متری'),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.lightBlueColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                children: [
                  lottie.Lottie.asset(
                    'assets/images/offer_animation.json',
                    width: 80,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: const [
                          TextSpan(
                            text: 'اگر ساعتهای تمرین تون بصورت',
                          ),
                          TextSpan(
                            text: ' مستمر و بلند مدت ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'باشه، درصورت تسویه ماهانه',
                          ),
                          TextSpan(
                            text: ' تخفیف قابل توجهی ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF0000),
                            ),
                          ),
                          TextSpan(
                            text: 'به شما تعلق میگیره',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Iconsax.camera),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'برای برگزاری ورکشاپ یا فیلمبرداری در سالن ۸۰ متری که دیوار کروماکی هم داره با ما تماس بگیرید',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              indent: 60,
              endIndent: 60,
              thickness: 1.5,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'راه های ارتباطی',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Iconsax.instagram,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Text('آدرس اینستاگرام پلاتو: Pelato.markazi'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Iconsax.mobile,
                  color: Colors.green,
                ),
                const SizedBox(width: 5),
                Text('تلفن تماس و واتساپ: 09024349208'.toPersianDigit()),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Iconsax.location,
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'نشانی: تهران ضلع جنوب غربی میدان انقلاب جنب سینما مرکزی پلاک ۷۲ زنگ ۱'
                        .toPersianDigit(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 500,
              child: FlutterMap(
                options: MapOptions(
                  center: const LatLng(35.700666, 51.390358),
                  zoom: 16,
                  maxZoom: 18,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.pelato_markazi',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(35.700766, 51.390258),
                        builder: (context) {
                          return Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              'assets/images/pin.png',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
