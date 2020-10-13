import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:signup/Login_signup/widgets/widgets.dart';
import 'dart:ui';
import 'user_details_view.dart';
import './social_media_view.dart';
import 'package:signup/Login_signup/Data/data.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginSignupPage createState() => _LoginSignupPage();
}

class _LoginSignupPage extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  List<Color> backgroundGradient = [
    const Color(0xFF773cb7),
    const Color(0xFF3657b9),
  ];

  AnimationdData animationdData;
  AnimationController _progressAnimationController;
  @override
  void initState() {
    super.initState();
    animationdData = AnimationdData.loginData();
    initAnimationController();
  }

  initAnimationController() {
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {
          animationdData.userDetailsContainerBottomSlopeFrom = lerpDouble(
              animationdData.userDetailsContainerBottomSlopeFrom,
              animationdData.userDetailsContainerBottomSlopeTo,
              _progressAnimationController.value);
        });
      });
  }

  UserDetailsList animatedTextFieldList = UserDetailsList();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false, //new line

      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            TitleBar(title: animationdData.title),
            Stack(
              children: [
                //userdetails container
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: screenWidth,
                  height:
                      screenHeight * animationdData.userDetailsContainerSize,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: UserDetailsView(
                    animatedTextFieldList: animatedTextFieldList,
                    bottomLength:
                        animationdData.userDetailsContainerBottomSlopeFrom,
                    listviewContainerHeight:
                        animationdData.listviewContainerHeight,
                    title: animationdData.title,
                  ),
                ),

                //social media container
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: screenWidth,
                  height: screenHeight * 0.30,
                  margin: EdgeInsets.only(
                      top: screenHeight *
                          animationdData.socialMediaContinerMargin,
                      left: 20,
                      right: 20),
                  child: SocialMediaView(
                    title: animationdData.title,
                  ),
                ),
              ],
            ),
            // bottom text container
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text.rich(TextSpan(
                  text: animationdData.pageChangerText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      textBaseline: TextBaseline.alphabetic),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //swape between login and signup screens
                          setState(() {
                            if (animationdData.title.contains("LOGIN")) {
                              animationdData = AnimationdData.signUpData();
                              animatedTextFieldList.insert();
                              _progressAnimationController.forward();
                            } else {
                              animationdData = AnimationdData.loginData();
                              animatedTextFieldList.remove();
                              _progressAnimationController.reverse();
                            }
                          });
                        },
                      text: "Click Here",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 15,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
