import 'package:flutter/material.dart';

import '../../../../core/app/app_dimensions.dart';

class CustomScreenTtle extends StatelessWidget {
  const CustomScreenTtle({super.key, required this.screentitle});

  final String screentitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.p18,
        bottom: AppDimensions.p24,
      ),
      child: Text(
        screentitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
