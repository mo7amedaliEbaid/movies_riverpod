import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_riverpod/app/app_strings.dart';
import 'package:movies_riverpod/app/app_theme.dart';
import 'package:movies_riverpod/shared/provider/app_theme_provider.dart';
import 'package:movies_riverpod/shared/responsive/responsive.dart';

import '../routes/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(appThemeProvider);
    log(MediaQuery.sizeOf(context).height.toString());
    log(MediaQuery.sizeOf(context).width.toString());
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        designSize: Responsive.isMobile(context)
            ? const Size(384, 784)
            : const Size(1460, 720),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            title: AppStrings.appName,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: themeMode.currentTheme,
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
