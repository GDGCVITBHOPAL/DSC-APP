import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:dsc_client/data/models/onBoardingModel.dart';
import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:dsc_client/widgets/pageIndicator.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  PageController? controller;
  @override
  void initState() {
    super.initState();
    CustomSharedPreferences.setBool("IS_FIRST_TIME_RUN", false);
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: new BoxDecoration(
          //   gradient: new LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Colors.white,
          //       MyColors.primaryColor,
          //     ],
          //   ),
          // ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          controller!.animateToPage(2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                ],
              ),
              Expanded(
                flex: 8,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  children: <Widget>[
                    SlideTile(
                      imagePath: mySLides[0].getImageAssetPath(),
                      title: mySLides[0].getTitle(),
                      desc: mySLides[0].getDesc(),
                      isFirst: true,
                    ),
                    SlideTile(
                      imagePath: mySLides[1].getImageAssetPath(),
                      title: mySLides[1].getTitle(),
                      desc: mySLides[1].getDesc(),
                    ),
                    SlideTile(
                      imagePath: mySLides[2].getImageAssetPath(),
                      title: mySLides[2].getTitle(),
                      desc: mySLides[2].getDesc(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInCheck()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 36,
                          // Constructor Call #2
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == slideIndex
                              ? buildPageIndicator(
                                  true,
                                  Constants.googleLogoColorsList[
                                      Constants.googleLogoColorsList.length -
                                          i -
                                          1],
                                )
                              : buildPageIndicator(
                                  false,
                                  Constants.googleLogoColorsList[
                                      Constants.googleLogoColorsList.length -
                                          i -
                                          1],
                                ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
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

class SlideTile extends StatelessWidget {
  final String? imagePath, title, desc;
  final bool isFirst;

  SlideTile({this.imagePath, this.title, this.desc, this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "logo",
            child: Image.asset(
              imagePath!,
              scale: isFirst ? 3 : 1,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          AutoSizeText(
            title!,
            minFontSize: 15,
            // maxLines: 1,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              //color: Colors.grey,
            ),
          ),
          Text(
            desc!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
