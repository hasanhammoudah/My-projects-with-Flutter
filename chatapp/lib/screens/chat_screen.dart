import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/screens/widget/chat_buble.dart';
import 'package:chatapp/screens/widget/chat_buble_for_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  static String id = 'ChatPage';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    /* I use this line for argument email that on the screen login to put email for this screen 'chat_screen.dart'  */
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessageCollections);

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // TODO repeat for this line
          List<Message> messagesList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo),
                  const Text('Scholar Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ChatBuble(
                                message: messagesList[index],
                              )
                            : ChatBubleForFriend(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controller,
                    // TODO Serach the type onSubmitted and onSaved and onchanged
                    onSubmitted: (data) {
                      var date = DateTime.now();
                      messages
                          .add({kMessage: data, kCreatedAt: date, 'id': email})
                          .then((value) => print('Messages Added'))
                          .catchError((error) =>
                              print('Failed to add message: $error'));
                      controller.clear();
                      /*  This line to show the last sentence of chat  */
                      _controller.animateTo(0,
                          duration: const Duration(seconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: const Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: kPrimaryColor)),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
