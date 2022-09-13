import 'package:flutter/material.dart';
import 'package:intropage/home.dart';
import 'package:intropage/intro_screens/intro_one.dart';
import 'package:intropage/intro_screens/intro_three.dart';
import 'package:intropage/intro_screens/intro_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controller keeps track with which page we are on
  PageController pagecontroller = PageController();

  //check to see if we are on the last page

  // ignore: non_constant_identifier_names
  bool OnLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pagecontroller,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });
            },
            children: const [IntroOne(), IntroTwo(), IntroThree()],
          ),
          //controller
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //SKIP
                GestureDetector(
                    onTap: () {
                      pagecontroller.jumpToPage(2);
                    },
                    child: const Text('Skip')),

                SmoothPageIndicator(controller: pagecontroller, count: 3),

                //Next
                OnLastPage
                    ? GestureDetector(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        }),
                        child: const Text('Done'),
                      )
                    : GestureDetector(
                        onTap: (() {
                          pagecontroller.nextPage(
                              duration: const Duration(microseconds: 100),
                              curve: Curves.easeIn);
                        }),
                        child: const Text('Next'),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
