import 'package:flutter/material.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';

import '../app/app_colors.dart';

class GenreChip extends StatelessWidget {
  final String label;

  const GenreChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Chip(
        label: Text(
          label,
          style: context.textTheme.bodySmall!.copyWith(
              color: context.theme.brightness == Brightness.light
                  ? AppColors.chipTextLight
                  : AppColors.chipTextDark),
        ),
        backgroundColor: context.theme.brightness == Brightness.light
            ? AppColors.chipColorLight
            : AppColors.chipColorDark,
      ),
    );
  }
}
