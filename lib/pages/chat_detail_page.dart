import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instragram_clone_app/data/chat_detail_json.dart';
import 'package:instragram_clone_app/data/chat_json.dart';
import 'package:instragram_clone_app/theme/colors.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:keyboard_avoider/keyboard_avoider.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  PreferredSizeWidget getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(55),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    splashRadius: 20,
                    icon: const Icon(Icons.arrow_back_ios, color: white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(width: 10),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(chats[0].profile!),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  chats[0].username!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  color: white,
                  icon: const Icon(Feather.video),
                  onPressed: () {},
                ),
                const SizedBox(width: 5),
                IconButton(
                  splashRadius: 20,
                  color: white,
                  icon: const Icon(Feather.info),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(size) {
    return KeyboardAvoider(
      autoScroll: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: size.height * 0.83,
              child: ListView(
                children: List.generate(
                  chatDetails.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ChatBubbles(
                        isMe: chatDetails[index].isMe!,
                        profile: chatDetails[index].profile!,
                        message: chatDetails[index].message!,
                        messageNo: chatDetails[index].messageNo!,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: grey.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.1,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: black,
                        ),
                        child: const Center(
                          child: Icon(
                            Feather.camera,
                            color: white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextField(
                            cursorColor: black.withOpacity(0.5),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message...",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              SimpleLineIcons.microphone,
                              color: white,
                            ),
                            Icon(
                              Feather.image,
                              color: white,
                            ),
                            Icon(
                              MaterialCommunityIcons.sticker_emoji,
                              color: white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubbles extends StatelessWidget {
  final bool isMe;
  final String profile, message;
  final int messageNo;

  const ChatBubbles(
      {Key? key,
      required this.isMe,
      required this.profile,
      required this.message,
      required this.messageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo),
                color: grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profile), fit: BoxFit.cover)),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo),
                color: grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  getBorderRadiusMessage(messageNo) {
    if (isMe) {
      if (messageNo == 1) {
        return const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 2) {
        return const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 3) {
        return const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    } else {
      if (messageNo == 1) {
        return const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 2) {
        return const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else if (messageNo == 3) {
        return const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    }
  }
}
