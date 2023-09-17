import 'package:flutter/material.dart';

class SalonFeatureWidget extends StatelessWidget {
  const SalonFeatureWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(
          color: Colors.black87,
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
