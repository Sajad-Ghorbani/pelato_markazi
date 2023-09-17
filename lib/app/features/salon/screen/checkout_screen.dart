import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';
import 'package:pelato_markazi/app/core/widgets/custom_text_field.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBarTitle: 'پرداخت',
      showLeading: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'اگه کد تخفیف داری اینجا وارد کن',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 10),
            const CustomTextField(
              labelText: 'کد تخفیف',
              labelIcon: Icon(Iconsax.ticket_discount),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('اعمال'),
            ),
            const SizedBox(height: 10),
             Text('مبلغ نهایی: 2,650,000 تومان'.toPersianDigit(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(
                    text: 'برای رزرو نهایی، مبلغ رو به شماره کارت ',
                  ),
                  TextSpan(
                    text: '6274121206627960 به نام نرجس خراط طاهردل',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const TextSpan(
                    text: ' واریز کن و رسید رو به شماره واتساپ پلاتو ارسال کن.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'برای تکمیل مراحل از الان یک ساعت فرصت داری',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text('1:00:00'.toPersianDigit(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),), //TODO: this should be count down
            const SizedBox(height: 10),
            Text(
              '* در صورت واریز بعد از این زمان رزرو تلقی نمیشه و در صورت بوجود آمدن مشکل، مسئولیت آن با شماست.',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.homeScreen);
              },
              child: const Text('رفتن به صفحه اصلی'),
            ),
          ],
        ),
      ),
    );
  }
}
