import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);

  List<Message> messagesList = [];

  void SendMeeage({required String message, required String email}) {
    try {
      messages
          .add({kMessage: messages, kCreatedAt: DateTime.now(), 'id': email})
          .then((value) => print('Messages Added'))
          .catchError((error) => print('Failed to add message: $error'));
    } catch (e) {}
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
