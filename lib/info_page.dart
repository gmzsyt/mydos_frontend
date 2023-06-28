import 'package:c/learn_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<String> categories = <String>[];
  int index =0;
  String category= "a";

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
              child: Image.asset("images/profilephoto.png"),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      "images/profilephoto.png",
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
                    GestureDetector(onTap: () {
                    },child: const Text("My Mistakes")),
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
                GestureDetector(
                  onTap: (){
                    setState(() {
                      category = "travel";
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LearnPage(category)));
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/travel.png"),
                        fit: BoxFit.cover,
                      ),
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
                      "Travel",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xffCC003A),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      category = "food and drink";
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LearnPage(category)));
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/fruits.png"),
                        fit: BoxFit.cover,
                      ),
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
                      "Food and Drinks",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xffCC003A),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image:  const DecorationImage(
                      image: AssetImage("images/farm_animals.png"),
                      fit: BoxFit.cover,
                    ),
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
                    image:  const DecorationImage(
                    image: AssetImage("images/family_members.png"),
                    fit: BoxFit.cover,
                    ),
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
                    image:  const DecorationImage(
                      image: AssetImage("images/colors.png"),
                      fit: BoxFit.cover,
                    ),
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
                    "Food and Drink",
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
  /*
  List addCategories(){
    String lastCategoris = stateManagement.datas[index]["topic"];
    categories.add(lastCategoris);
    index++;
      for(int i = 1;index < stateManagement.datas.length - 1; i++){
        if(stateManagement.datas[index]["topic"] != lastCategoris){
          categories.add(stateManagement.datas[index]["topic"]);
          lastCategoris = stateManagement.datas[index]["topic"];
        }
      }
    return categories;
  }
  Container? addContainer(){
    for(int i=0;i<categories.length;i++){
      return Container(
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
        child: Text(
          categories[index],
          style: const TextStyle(
            fontSize: 50,
            color: Color(0xffCC003A),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return null;
  }
   */
}
