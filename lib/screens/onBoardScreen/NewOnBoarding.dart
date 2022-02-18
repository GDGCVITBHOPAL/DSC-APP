import 'package:animate_do/animate_do.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:dsc_client/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:sprout/model_data/colors.dart';
// import 'package:sprout/pages/authenticationPage.dart';
// import 'package:sprout/widgets/carousel_page/skip_button.dart';
// import 'package:sprout/widgets/common/sbutton.dart';
import 'package:unicons/unicons.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  ///////////////////////////// VARIABLE DECLARATIONS //////////////////////////////
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: isActive ? 40 : 20,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey.shade500 : Colors.grey.shade200,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Skip Button
              Skip(_currentPage, _numPages),

              SizedBox(
                height: 100.h,
              ),

              FadeIn(
                child: Container(
                  height: 500.h,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      // Carousel Cards
                      // 1st Card
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Image.asset(
                              "assets/images/stay_in_the_know-final.png",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Stay in the know.',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'Keep track of all our previous and upcoming events. Make sure you RSVP your seat in the upcoming events 😉',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      // 2nd Card
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Image.asset(
                              "assets/images/istockphoto-1216655411-612x612-removebg-preview.png",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Learn and grow.',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'Read the blogs and articles written by the team. We\'re sure you will learn something intersting in every articles. ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      // 3rd Card
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Image.asset(
                              "assets/images/istockphoto-1207202567-612x612-removebg-preview.png",
                              width: 200.w,
                            )),
                            SizedBox(height: 70.0.h),
                            Text(
                              'Ready let\'s go!',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 15.0.h),
                            Text(
                              'Let\'s get you logged in. We can\'t wait for you to explore our app.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              //////////////// FAB ///////////////////
              _currentPage != _numPages - 1
                  ? Container(
                      height: 51.5.h,
                      child: FloatingActionButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        elevation: 0,
                        splashColor: Colors.transparent,
                        highlightElevation: 0,
                        backgroundColor: Colors.green.shade400,
                        child: Icon(UniconsLine.arrow_right),
                      ),
                    )
                  : FadeIn(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInCheck()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 36.h,
                            // Constructor Call #2
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          style: ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade400),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ))),
                        ),
                      ),
                    ),

              /////////////////////////////////////////////
              SizedBox(
                height: 80.h,
              ),

              //////////////// SLIDERS ///////////////////
              FadeIn(
                delay: Duration(seconds: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
