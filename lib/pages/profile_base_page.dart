import 'package:flutter/material.dart';
import 'package:instragram_clone_app/pages/gallery_page.dart';
import 'package:instragram_clone_app/pages/photo_video_page.dart';
import 'package:instragram_clone_app/theme/colors.dart';
import 'package:instragram_clone_app/widgets/profile_header_widget.dart';

class ProfileBaseScreen extends StatefulWidget {
  const ProfileBaseScreen({Key? key}) : super(key: key);

  @override
  _ProfileBaseScreenState createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            color: black,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "nyluzi",
              style: TextStyle(color: white, fontWeight: FontWeight.w600),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: white,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: black,
                child: TabBar(
                  labelColor: white,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: white,
                  tabs: const [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.video_camera_front,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),

              // Igtv(),
              const Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    Reels(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
