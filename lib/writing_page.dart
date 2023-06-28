import 'dart:async';
import 'dart:math';

import 'package:c/listen_page.dart';
import 'package:c/my_interest.dart';
import 'package:c/state_management.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pinput/pinput.dart';

class WritingPage extends StatefulWidget {
  const WritingPage(this.selectedTopic, {super.key});
  final String selectedTopic;

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late ConfettiController _controllerCenter;
  TextEditingController pinPutController = TextEditingController();
  StateManagement stateManagement = Get.put(StateManagement());
  int index = 0;
  final player = AudioPlayer();
  List currentTopicList = [];
  String _isCorrectAnswer = "a";
  Timer? _timer;


  @override
  void initState() {
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 2));
    super.initState();
    fonksiyon();
    super.initState();
  }
  fonksiyon(){
    for(int i = 0; i < stateManagement.datas.length; i++){
      if(stateManagement.datas[i]["topic"] == widget.selectedTopic){
        currentTopicList.add(stateManagement.datas[i]);
      }
    }
    setState(() {
      currentTopicList;
    });
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep), halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyInterst(widget.selectedTopic)));
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
                        stateManagement.datas[index]["topic"],
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
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality.explosive,
                      // don't specify a direction, blast randomly
                      colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
                      // manually specify the colors to be used
                      createParticlePath: drawStar, // define a custom shape/path.
                    ),
                  ),
                  Text("${index+1} / ${currentTopicList.length}",style: const TextStyle(color:Color(0xffCC003A),fontWeight: FontWeight.w700),),
                  Stack(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xffCC003A),
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: AssetImage(currentTopicList[index]["image"]),
                            fit: BoxFit.cover,
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
                      Positioned(
                        height: 200,
                        width: 200,
                        top: (250 - 200) / 2, // Görselin yükseklikten animasyon yüksekliği çıkarılarak ortalanması sağlandı
                        right: (250 - 200) / 2, // Görselin genişlikten animasyon genişliği çıkarılarak ortalanması sağlandı
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 600),
                          opacity: _isCorrectAnswer == "t" ? 1.0 : 0.0,
                            child: Image.asset("images/true.png",width: 200,)
                        ),
                      ),
                      Positioned(
                        height: 200,
                        width: 200,
                        top: (250 - 200) / 2, // Görselin yükseklikten animasyon yüksekliği çıkarılarak ortalanması sağlandı
                        right: (250 - 200) / 2,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _isCorrectAnswer == "f" ? 1.0 : 0.0,
                          child: Image.asset(
                            "images/false.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: Pinput(
                      controller: pinPutController,
                      length:currentTopicList[index]["languageList"]["labelEN"].length,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), border: Border.all(color: const Color(0xffCC003A), width: 2))),
                    ),
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
                        if (pinPutController.text == "") {
                          Get.snackbar("Hata!", "Kelimeyi tamamlayın!", backgroundColor: Colors.red, colorText: Colors.white);
                        } else {
                          if (currentTopicList[index]["languageList"]["labelEN"] == pinPutController.text) {
                            _controllerCenter.play();
                            if (index < currentTopicList.length - 1) {
                              setState(() {
                                pinPutController.text = "";
                                index++;
                              });
                              //_controllerCenter.stop();
                            } else if (index == currentTopicList.length - 1) {
                              Get.snackbar("Harika!", "Bölümü tamamladın!", backgroundColor: Colors.green, colorText: Colors.white);
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListenPage(widget.selectedTopic)));
                            }
                          } else {
                            Get.snackbar("Hata!", "Kelimeyi yanlış yazdınız, tekrar deneyin!", backgroundColor: Colors.red, colorText: Colors.white);
                            setState(() {
                              currentTopicList[index]["check"] = "false";
                              print(currentTopicList[index]["check"] = "false");
                            });
                            pinPutController.text = "";
                          }
                        }
                      },
                      child: GestureDetector(
                        onTap: _checkAnswer,
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
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }
  void _checkAnswer() {
    String userInput = pinPutController.text;
    String correctAnswer = currentTopicList[index]["languageList"]["labelEN"];
    if (pinPutController.text == "") {
      Get.snackbar("Hata!", "Kelimeyi tamamlayın!", backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      if (userInput == correctAnswer) {
        setState(() {
          _isCorrectAnswer = "t";
        });
        if (index < currentTopicList.length - 1) {
          setState(() {
            _timer = Timer(const Duration(seconds: 1), () {
              setState(() {
                _isCorrectAnswer = "a";
              });
              pinPutController.text = "";
              index++;
            });
          });
          //_controllerCenter.stop();
        } else if (index == currentTopicList.length - 1) {
          Get.snackbar("Harika!", "Bölümü tamamladın!", backgroundColor: Colors.green, colorText: Colors.white);
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListenPage(widget.selectedTopic)));
        }
      } else {
        Get.snackbar("Hata!", "Kelimeyi yanlış yazdınız, tekrar deneyin!", backgroundColor: Colors.red, colorText: Colors.white);
        setState(() {
          _isCorrectAnswer = "f";
          currentTopicList[index]["check"] = "false";
        });
        pinPutController.text = "";
      }
    }
  }
  void timerClose() {
    _timer?.cancel();
    super.dispose();
  }
}

