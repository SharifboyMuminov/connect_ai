import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini_connect/data/enums/forms_status.dart';

class ChatState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final List<ChatMessage> messages;
  final FormsStatus formsStatus;

  const ChatState({
    required this.formsStatus,
    required this.statusMessage,
    required this.messages,
    required this.errorMessage,
  });

  ChatState copyWith({
    String? errorMessage,
    String? statusMessage,
    List<ChatMessage>? messages,
    FormsStatus? formsStatus,
  }) {
    return ChatState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ChatState.initial() {
    return const ChatState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      messages: [],
      errorMessage: "",
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        statusMessage,
        messages,
        formsStatus,
      ];
}
