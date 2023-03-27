import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "images/redstone1.png",
              width: 150,
            ),
          ],
        ),
        actions: [
          Image.asset(
            "images/bell_fill.png",
            width: 20,
          ),
          const SizedBox(width: 10),
          PopupMenuButton(
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Image.asset("images/img.png"),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      "images/img.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Profile"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Image.asset(
                      "images/book.png",
                      width: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("My Interest"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      "images/bildirim.jpg",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Notifications"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      "images/translation.png",
                      width: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Chose Language"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      "images/signout.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Sign Out"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/homep-bg.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  percent: 50 / 100,
                  lineHeight: 20,
                  width: 500.0,
                  animation: true,
                  animationDuration: 1500,
                  progressColor: const Color(0xffCC003A),
                  leading: const Text(
                    "Level 1",
                    style: TextStyle(
                      color: Color(0xffCC003A),
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Text(
                    "%50",
                    style: TextStyle(
                      color: Color(0xffCC003A),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Text(
                "Chosen For You",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xffCC003A),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Colors",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Fruits",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Farm Animals",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Family Members",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 10, left: 90, right: 90),
                  child: const Divider(
                    color: Color(0xffCC003A),
                    height: 100,
                  )),
              const Text(
                "Others",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xffCC003A),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Colors",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Fruits",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Farm Animals",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCC003A),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Family Members",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xffCC003A),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
