import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_connect/utils/app_colors.dart';
import 'package:gemini_connect/utils/app_text_style.dart';

showErrorDialog(BuildContext context,{required VoidCallback onTabTryAgain}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: Text(
          "Internet connection error or invalid key :(",
          style: AppTextStyle.montserratMedium.copyWith(
            fontSize: 15.sp,
          ),
        ),
        actions: [
          CupertinoButton(
            onPressed: onTabTryAgain,
            child: Text(
              "try again",
              style: AppTextStyle.montserratRegular
                  .copyWith(color: AppColors.c4F75FF),
            ),
          )
        ],
      );
    },
  );
}
