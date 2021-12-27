import 'package:flutter/material.dart';
import 'package:instragram_clone_app/data/highlight_item.dart';
import 'package:instragram_clone_app/theme/colors.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: black),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff74EDED),
                backgroundImage: NetworkImage(
                    "https://source.unsplash.com/500x500/?nature,face"),
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Text(
                        "23",
                        style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(
                          color: white,
                          fontSize: 15,
                          letterSpacing: 0.4,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: const [
                      Text(
                        "1.5M",
                        style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          color: white,
                          letterSpacing: 0.4,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: const [
                      Text(
                        "234",
                        style: TextStyle(
                          color: white,
                          letterSpacing: 0.4,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          color: white,
                          letterSpacing: 0.4,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "    Nyluzi",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const SizedBox(
            height: 20,
          ),
          actions(context),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 85,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: highlightItems.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(highlightItems[index].thumbnail),
                              radius: 28,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            highlightItems[index].title,
                            style: const TextStyle(
                              fontSize: 13,
                              color: white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget actions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: OutlinedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("Edit Profile", style: TextStyle(color: white)),
          ),
          style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(0, 30),
              side: BorderSide(
                color: Colors.grey.shade400,
              )),
          onPressed: () {},
        ),
      ),
    ],
  );
}
