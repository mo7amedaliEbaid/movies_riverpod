import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_riverpod/app/app_strings.dart';
import 'package:movies_riverpod/shared/extensions/build_context_extensions.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.sp),
          ),
        ),
        onPressed: () {},
        child: Text(
          AppStrings.seeMore,
          style: context.textTheme.bodySmall,
        ));
  }
}
