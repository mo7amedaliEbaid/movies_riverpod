import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_riverpod/app/app_colors.dart';
import 'package:movies_riverpod/app/app_strings.dart';
import 'package:movies_riverpod/features/notifications/presentation/screen/notification_screen.dart';
import 'package:movies_riverpod/shared/extensions/build_context_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Color iconColor = context.theme.brightness == Brightness.light
        ? AppColors.primaryLight
        : AppColors.primaryDark;
    return AppBar(
      title: Text(
        AppStrings.appName,
        style: context.textTheme.titleMedium,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            color: iconColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                notificationBottomSheet(context);
              },
              icon: Icon(
                Icons.notification_add,
                color: iconColor,
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.sp);
}

