import 'package:flutter/material.dart';
import 'package:signup/Login_signup/widgets/widgets.dart';

class SocialMediaView extends StatelessWidget {
  final String title;

  const SocialMediaView({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return socialMediaView();
  }

  socialMediaView() {
    return CustomPaint(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 50, left: 50),
              child: Text(
                "OR\n\n" + title.toLowerCase() + " With Social Media",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...['facebook.png', 'search.png', 'twitter.png'].map((path) {
                    return Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Image(image: AssetImage('images/' + path)));
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ),
      painter: ContainerShape(
        color: Colors.white,
        isUserId: false,
      ),
    );
  }
}
