import 'package:flutter/material.dart';
import 'package:instragram_clone_app/theme/colors.dart';

class Reels extends StatelessWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: black,
      body: Center(
        child: Text(
          '  Photos And \nVidoes of You',
          style: TextStyle(
            color: white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
