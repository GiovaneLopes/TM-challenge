import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconButton? leading;
  const CustomAppBar({
    super.key,
    this.leading,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: Builder(
        builder: (context) =>
            leading ??
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColors.textPrimary,
                size: SizeHelper.adaptiveSize(context, 32.w, 0.01),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      ),
      title: Image.asset(
        AppImages.logoWhite,
        width: SizeHelper.adaptiveSize(context, 112.h, 0.05),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: AppColors.textPrimary,
            size: SizeHelper.adaptiveSize(context, 32.w, 0.01),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
