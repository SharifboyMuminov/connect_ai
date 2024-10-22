import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_connect/data/local/storage_repository.dart';
import 'package:gemini_connect/screens/dialogs/error_dialog.dart';
import 'package:gemini_connect/screens/home_screen/home_screen.dart';
import 'package:gemini_connect/screens/widget/main_button.dart';
import 'package:gemini_connect/utils/app_colors.dart';
import 'package:gemini_connect/utils/app_size.dart';
import 'package:gemini_connect/utils/app_text_style.dart';

class EnterKeyScreen extends StatefulWidget {
  const EnterKeyScreen({super.key});

  @override
  State<EnterKeyScreen> createState() => _EnterKeyScreenState();
}

class _EnterKeyScreenState extends State<EnterKeyScreen> {
  String? errorText;
  String previousValue = "";
  String currentValue = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.we),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.getH(),
              Image.asset(
                "assets/images/gemini_icon.png",
                width: 200.we,
              ),
              100.getH(),
              TextFormField(
                onChanged: (String v) {
                  if (!loading) {
                    setState(() {
                      currentValue = v;
                    });
                  }
                },
                cursorColor: AppColors.c7AB2D3,
                style: AppTextStyle.montserratMedium.copyWith(
                  fontSize: 15.sp,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.c7AB2D3,
                      width: 2.we,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.c7AB2D3,
                      width: 1.we,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.we,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.we,
                    ),
                  ),
                  errorText: errorText,
                  errorStyle: AppTextStyle.montserratRegular.copyWith(
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                  hintText: "Enter gemini key...",
                  hintStyle: AppTextStyle.montserratMedium.copyWith(
                    color: AppColors.black.withOpacity(0.5),
                    fontSize: 14.sp,
                  ),
                ),
              ),
              30.getH(),
              MainButton(
                isActive: currentValue.isNotEmpty && !loading,
                isLoading: loading,
                onTab: () {
                  loading = true;
                  setState(() {});
                  Gemini.init(apiKey: currentValue);

                  Gemini.instance.streamGenerateContent("Hello").listen((v) {
                    StorageRepository.setString(
                      key: "gemini_key",
                      value: currentValue,
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                      (v) => false,
                    );
                    loading = false;
                    setState(() {});
                  }).onError((error) {
                    showErrorDialog(context, onTabTryAgain: () {
                      Navigator.pop(context);
                      setState(() {
                        errorText = "invalid key...";
                      });
                    });
                    loading = false;
                    setState(() {});
                  });
                },
                title: "Save key",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
