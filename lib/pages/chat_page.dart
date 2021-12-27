// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instragram_clone_app/data/chat_json.dart';
import 'package:instragram_clone_app/pages/chat_detail_page.dart';
import 'package:instragram_clone_app/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(size),
      bottomSheet: getBottomSheet(),
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
                  splashRadius: 15,
                  icon: const Icon(Icons.arrow_back_ios, color: white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
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
                  icon: const Icon(Feather.edit),
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
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Center(
                      child: Text(
                        "Chats",
                        style: TextStyle(
                            color: selectedIndex == 0
                                ? white
                                : white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Center(
                      child: Text(
                        "Rooms",
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? white
                                : white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: size.width,
              decoration: const BoxDecoration(color: grey),
            ),
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getChats(size),
            getRooms(size),
          ],
        ),
      ],
    );
  }

  Widget getChats(size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: 41,
            width: (size.width - 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: grey.withOpacity(0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextField(
                  cursorColor: white.withOpacity(0.5),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: white.withOpacity(0.5),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: white.withOpacity(0.5)),
                  )),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(chats.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: (size.width - 20) * 0.15,
                      width: (size.width - 20) * 0.15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(chats[index].profile!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          chats[index].dateTime == "now"
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: white),
                                      color: green,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (size.width - 20) * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chats[index].username!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: white,
                              ),
                            ),
                            Text(
                              "${chats[index].description} • ${chats[index].dateTime}",
                              style: const TextStyle(
                                  fontSize: 16, height: 1, color: grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 20) * 0.15,
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Feather.camera,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget getRooms(size) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            SvgPicture.asset("assets/images/video.svg", width: 100),
            const SizedBox(height: 20),
            const Text(
              "Video Chat With Anyone",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Invite up to 50 people to join a video chat, even if they don't have Instagram or Messenger.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: white.withOpacity(0.8)),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: const Center(
                child: Text(
                  "Create Room",
                  style: TextStyle(
                    color: black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    if (selectedIndex == 0) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          color: black,
          border: Border(
            top: BorderSide(
              width: 1,
              color: grey.withOpacity(0.3),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              FontAwesome.camera,
              color: white,
            ),
            SizedBox(width: 10),
            Text(
              "Camera",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 1,
      );
    }
  }
}
