
import 'dart:convert';

import 'package:c/Try.dart';
import 'package:c/finish_page.dart';
import 'package:c/info_page.dart';
import 'package:c/learn_page.dart';
import 'package:c/listen_page.dart';
import 'package:c/register.dart';
import 'package:c/state_management.dart';
import 'package:c/writing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{
  StateManagement stateManagement = Get.put(StateManagement());
  var data  = await rootBundle.loadString('assets/data.json');
  stateManagement.datas = jsonDecode(data);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "images/redstone1.png",
              width: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "|",
              style: TextStyle(fontSize: 35, color: Color(0xffCC003A)),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "LEARN ENGLISH",
              style: TextStyle(color: Color(0xffCC003A), fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "CONTACT",
              style: TextStyle(color: Color(0xffCC003A)),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "ABOUT US",
              style: TextStyle(color: Color(0xffCC003A)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              onPressed: () {Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                side: const BorderSide(
                  color: Color(0xffCC003A),
                ),
                foregroundColor: const Color(0xffCC003A),
                fixedSize: const Size(80, 20),
              ),
              child: const Text("LOGIN"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: const Color(0xffCC003A),
              ),
              child: const Text("REGISTER"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 800,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/top.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: const BorderSide(
                                color: Color(0xffCC003A),
                              ),
                              foregroundColor: const Color(0xffCC003A),
                              fixedSize: const Size(80, 30),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  const InfoPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "FIND OUT MORE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "WELCOME TO REDSTONE",
              style: TextStyle(
                color: Color(0xffCC003A),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
              child: Text(
                "When conducting the literature review, it is important to select from journals that are best suitable for your manuscript. These resources not only will help you prepare your manuscript, but also will help you increase the chance of acceptance for your manuscript. Another point to consider is that journal articles are the best sources to use. One of the common mistakes that is made by many authors is the selection and use of many books or dissertations. These two types of sources usually do not undergo a peer-review process and as a result their scholarly capacity may be questioned by the reviewers. When writing the literature  review section of your manuscript,  one of the first things you need to make sure is that every paragraph has a theme and that every sentence within the same paragraph  is a  part  of  this theme.  In  addition,  you also  need  to make  sure  that  paragraphs included within a section are consistent with the subheading that might be used.  Writing  the  discussion  section  tends  to  be  one  of  the  hardest  tasks  in  completing  a manuscript.  Study  findings  need  to  be  followed  closely  when  discussing  results.  Common mistakes  made  by authors  are discussing  a result  not supported  by  the  data,  not  discussing results  in  light  of  the  literature  review  presented,  and  presenting  suggestions  that  are  not supported by the findings. ",
                style: TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              customCard(),
              customCard(),
              customCard(),
            ]),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/mid.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "LOREM IPSUM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "When conducting the literature review, it is important to select from journals that are best suitable for your manuscript. These resources not only will help you prepare your manuscript, but also will help you increase the chance of acceptance for your manuscript. Another point to consider is that journal articles are the best sources to use. One of the common mistakes that is made by many authors is the selection and use of many books or dissertations. These two types of sources usually do not undergo a peer-review process and as a result their scholarly capacity may be questioned by the reviewers. When writing the literature  review section of your manuscript,  one of the first things you need to make sure is that every paragraph has a theme and that every sentence within the same paragraph  is a  part  of  this theme.  In  addition,  you also  need  to make  sure  that  paragraphs included within a section are consistent with the subheading that might be used.  Writing  the  discussion  section  tends  to  be  one  of  the  hardest  tasks  in  completing  a manuscript.  Study  findings  need  to  be  followed  closely  when  discussing  results.  Common mistakes  made  by authors  are discussing  a result  not supported  by  the  data,  not  discussing results  in  light  of  the  literature  review  presented,  and  presenting  suggestions  that  are  not supported by the findings. ",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              customCard2(),
              customCard2(),
            ]),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/bot.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffCC003A),
          width: 2,
        ),
      ),
      child: const Center(child: Text("MyText", style: TextStyle(fontSize: 20))),
    );
  }

  Widget customCard2() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffCC003A),
          width: 2,
        ),
      ),
      child: const Center(child: Text("MyText", style: TextStyle(fontSize: 20))),
    );
  }
}
