import 'package:flutter/material.dart';

class HelpLabelWidget extends StatelessWidget {
  const HelpLabelWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
