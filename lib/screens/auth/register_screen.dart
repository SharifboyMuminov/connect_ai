import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_connect/screens/auth/enter_key_screen.dart';
import 'package:gemini_connect/screens/widget/main_button.dart';
import 'package:gemini_connect/utils/app_size.dart';
import 'package:gemini_connect/utils/app_text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, you need to get a key to use this Gemini.",
              style: AppTextStyle.montserratMedium.copyWith(
                fontSize: 20.sp,
              ),
            ),
            20.getH(),
            MainButton(
              onTab: onTabGetKey,
              title: "Get key",
              iconPath: "assets/icons/key.svg",
            ),
          ],
        ),
      ),
    );
  }

  onTabGetKey() async {
    // final uri = Uri.parse("https://ai.google.dev/");
    //
    // try {
    //   await canLaunchUrl(uri);
    //   await launchUrl(
    //     uri,
    //     mode: LaunchMode.inAppWebView,
    //     webViewConfiguration:
    //         const WebViewConfiguration(enableJavaScript: true),
    //   );
    // } catch (e) {
    //   throw 'Could not launch $e';
    // }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EnterKeyScreen();
        },
      ),
    );
  }
}
