import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemini_connect/utils/app_colors.dart';
import 'package:gemini_connect/utils/app_size.dart';
import 'package:gemini_connect/utils/app_text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTab,
    required this.title,
    this.iconPath = "",
    this.isActive = true,
    this.isLoading = false,
  });

  final VoidCallback onTab;
  final String title;
  final String iconPath;
  final bool isActive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.he),
        backgroundColor: isActive ? AppColors.c7AB2D3 : AppColors.cB4B4B8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: isActive ? onTab : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: isLoading
            ? [
                const CircularProgressIndicator(

                  color: AppColors.white,
                ),
              ]
            : [
                Text(
                  title,
                  style: AppTextStyle.montserratMedium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                if (iconPath.isNotEmpty) 15.getW(),
                if (iconPath.isNotEmpty)
                  SvgPicture.asset(
                    iconPath,
                    width: 20.we,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
              ],
      ),
    );
  }
}
