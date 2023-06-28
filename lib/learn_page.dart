
import 'package:c/state_management.dart';
import 'package:c/writing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class LearnPage extends StatefulWidget {
  const LearnPage(this.selectedTopic, {super.key});
  final String selectedTopic;

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  StateManagement stateManagement = Get.put(StateManagement());
  int index = 0;
  List currentTopicList = [];
  final player = AudioPlayer();

  @override
  void initState() {
    fonksiyon();
    super.initState();
  }

  fonksiyon(){
    print(widget.selectedTopic);
    for(int i = 0; i < stateManagement.datas.length; i++){
      if(stateManagement.datas[i]["topic"] == widget.selectedTopic){
        currentTopicList.add(stateManagement.datas[i]);
      }
    }
    setState(() {
      currentTopicList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentTopicList.isNotEmpty ? Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/homep-bg.png"),
          fit: BoxFit.cover,
        ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15),
            child: Container(
              width: 410,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xffCC003A),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                          child: const Divider(
                            color: Color(0xffCC003A),
                            height: 50,
                          ),
                        ),
                      ),
                       Text(
                        widget.selectedTopic,
                        style: const TextStyle(
                          color: Color(0XFFdc7c9b),
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                            child: const Divider(
                              color: Color(0xffCC003A),
                              height: 50,
                            )),
                      ),
                    ],
                  ),
                  Text("${index+1} / ${currentTopicList.length}",style: const TextStyle(color:Color(0xffCC003A),fontWeight: FontWeight.w700), ),
                   const SizedBox(height: 10),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xffCC003A),
                        width: 2,
                      ),
                      image: DecorationImage(image: AssetImage(currentTopicList[index]["image"]), fit: BoxFit.cover
                  ),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20,
                            offset: Offset(5, 10),
                            // shadow offset
                            spreadRadius: 0.1,
                            blurStyle: BlurStyle.normal // set blur style
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    children: [for (int i = 0; i < currentTopicList[index]["languageList"]["labelEN"].length; i++) box(currentTopicList[index]["languageList"]["labelEN"][i])],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          await player.setUrl(currentTopicList[index]["sound"]);
                          await player.play();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xffCC003A),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/headphones.png",
                              height: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Listen",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (index < currentTopicList.length - 1) {
                        setState(() {
                          index++;
                        });
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>   WritingPage(widget.selectedTopic)));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "NEXT",
                          style: TextStyle(
                            color: Color(0xffCC003A),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xffCC003A),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ) : const Center(child: CircularProgressIndicator(),),
    );
  }
  Widget box(String char) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xffCC003A),
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Text(char),
    );
  }
}
