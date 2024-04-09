import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_riverpod/core/app/app_dimensions.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';
import 'package:movies_riverpod/core/responsive/responsive.dart';

import 'package:movies_riverpod/features/notifications/presentation/screen/mobile_notification_screen.dart';

import '../../features/notifications/presentation/screen/desktop_notification_screen.dart';
import '../app/app_colors.dart';
import '../app/app_strings.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(0, AppDimensions.p64);
}

class _CustomAppBarState extends State<CustomAppBar> {

  TextEditingController textEditingController=TextEditingController();
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
      /*  Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: AnimSearchBar(
            width: 400,
            textFieldColor: iconColor,
            textController: textEditingController,
            color: iconColor,

            onSuffixTap: () {
              setState(() {
                textEditingController.clear();
              });
            }, onSubmitted: (String ) {  },
          ),
        ),*/
    /*    IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: iconColor,
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                if (Responsive.isDesktop(context)) {
                  desktopNotificationSideSheet(context);
                } else {
                  mobileNotificationBottomSheet(context);
                }
              },
              icon: Icon(
                Icons.notification_add,
                color: iconColor,
              )),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.sp);
}
