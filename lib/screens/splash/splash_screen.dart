import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_connect/data/local/storage_repository.dart';
import 'package:gemini_connect/screens/auth/register_screen.dart';
import 'package:gemini_connect/screens/dialogs/error_dialog.dart';
import 'package:gemini_connect/screens/home_screen/home_screen.dart';
import 'package:gemini_connect/utils/app_size.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _check();
    });
    super.initState();
  }

  _check() {
    String geminiKey = StorageRepository.getString(key: "gemini_key");

    debugPrint("My key: $geminiKey  ------------");

    if (geminiKey.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const RegisterScreen();
          },
        ),
      );
      return;
    }

    Gemini.init(apiKey: geminiKey);

    Gemini.instance.streamGenerateContent("hello").listen((v) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    }).onError((v) {
      showErrorDialog(context, onTabTryAgain: () {
        Navigator.pop(context);
        _check();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/lottie/gemini_lottie.json",
          width: width - (100.he),
        ),
      ),
    );
  }
}
