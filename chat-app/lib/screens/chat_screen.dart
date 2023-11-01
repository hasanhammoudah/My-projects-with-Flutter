import 'package:chatapp/constants.dart';
import 'package:chatapp/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/screens/widget/chat_buble.dart';
import 'package:chatapp/screens/widget/chat_buble_for_friend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {},
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: controller,
              // TODO Serach the type onSubmitted and onSaved and onchanged
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .SendMeeage(message: data, email: email.toString());
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
