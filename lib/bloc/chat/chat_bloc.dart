import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_connect/bloc/chat/chat_event.dart';
import 'package:gemini_connect/bloc/chat/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {}
}
