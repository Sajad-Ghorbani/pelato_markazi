import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/core/widgets/base_widget.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBarTitle: 'حریم خصوصی',
      showLeading: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سیاست نامه حریم خصوصی',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '«پلاتو مرکزی» به حریم خصوصی کاربران خود احترام می گذارد و متعهد به حفاظت از اطلاعات شخصی است که شما در اختیار آن می گذارید.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'چه اطلاعاتی توسط پلاتو از کاربر دریافت می شود؟',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '- در این برنامه اطلاعات شخصی شما از جمله نام و نام خانوادگی و شماره تماس و آدرس صفحات مجازی شما دریافت می شود.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'چه استفاده ای از این اطلاعات می شود؟',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'این اطلاعات برای ساخت حساب کاربری شما در دیتابیس ما استفاده '
                'می شود تا شما بتوانید با استفاده از حساب کاربری خود کارهای '
                'زیر را در برنامه انجام دهید.',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                '- ثبت سفارش',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                '- مشاهده سفارشات',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                '- ویرایش سفارشات',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                '- حذف سفارشات',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                'لازم به ذکر است که این اطلاعات به هیچ وجه در اختیار اشخاص ثالث'
                ' و سازمان و شرکتی قرار نمی گیرد و پلاتو مرکزی در رعایت حریم'
                ' خصوصی کاربران متعهد می باشد.',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                'این اطلاعات تنها در سرور پلاتو مرکزی ذخیره شده و در اپلیکیشن '
                'پلاتو مرکزی قابل مشاهده می باشد.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
