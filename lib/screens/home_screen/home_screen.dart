import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_connect/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatMessage> messages = [];
  final gemini = Gemini.instance;


  final ChatUser geminiAi = ChatUser(
    id: "gemini",
    lastName: "Gemini",
    profileImage:
    "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  final ChatUser user = ChatUser(
    id: "sharifjon",
    lastName: "Sharifjon",
    firstName: "Muminov",
    profileImage:
    "https://i.etsystatic.com/38615118/r/il/c9cef0/5983835163/il_570xN.5983835163_fuu7.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Gemini Chat",
          style: AppTextStyle.montserratMedium.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: DashChat(
        currentUser: user,
        onSend: _sendMessage,
        messages: messages,
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages.insert(0, chatMessage);
    });

    gemini.streamGenerateContent(chatMessage.text).listen((value) {
      messages.insert(
        0,
        ChatMessage(
          user: geminiAi,
          createdAt: DateTime.now(),
          text: value.output ?? "",
        ),
      );
      setState(() {});
    }).onError((e) {
      debugPrint("Error $e ---------------");
    });
  }
}
