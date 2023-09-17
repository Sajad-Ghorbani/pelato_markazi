import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
            const Text('''از اینکه پلاتو مرکزی رو انتخاب کردین سپاسگزاریم
افتخار ما همراهی با حرفه ای هاست

پلاتو مرکزی ۳ تا سالن داره که از بهترین و استانداردترین سالنهای تمرین با همه امکانات مورد نیاز به حساب میان.

دو سالن ۶۰ متری 
یک سالن ۸۰ متری

🔰اگر ساعتهای تمرین تون بصورت مستمر و بلند مدت باشه ، درصورت تسویه ماهانه تخفیف قابل توجهی به شما تعلق میگیره

❇️برای برگزاری ورکشاپ یا فیلمبرداری در سالن ۸۰ متری که دیوار کروماکی هم داره با ما تماس بگیرید
            '''),
            const Divider(
              indent: 60,
              endIndent: 60,
              thickness: 1.5,
            ),
            const SizedBox(height: 10),
            const Text('آدرس اینستاگرام پلاتو: Pelato.markazi'),
            const SizedBox(height: 5),
            Text('تلفن تماس و واتساپ: 09024349208'.toPersianDigit()),
            const SizedBox(height: 5),
            Text(
              'نشانی: تهران ضلع جنوب غربی میدان انقلاب جنب سینما مرکزی پلاک ۷۲ زنگ ۱'
                  .toPersianDigit(),
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
                            scaleY: 2.5,
                            scaleX: 1.5,
                            child: Image.asset('assets/images/pin.png',
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
