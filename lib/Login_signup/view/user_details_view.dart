import 'package:flutter/material.dart';
import 'package:signup/Login_signup/widgets/widgets.dart';

class UserDetailsView extends StatelessWidget {
  final double listviewContainerHeight;
  final UserDetailsList animatedTextFieldList;
  final double bottomLength;
  final String title;

  const UserDetailsView(
      {Key key,
      this.listviewContainerHeight,
      this.animatedTextFieldList,
      this.bottomLength,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return loginOrSignUpView(screenWidth: screenWidth);
  }

  loginOrSignUpView({double screenWidth}) {
    return CustomPaint(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: listviewContainerHeight,
              child: animatedTextFieldList,
            ),
            privacyPolicyAndFPassword(screenWidth: screenWidth),
            Expanded(
              child: Container(
                width: screenWidth,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  right: 20,
                  bottom: 30,
                ),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ],
        ),
      ),
      painter: ContainerShape(
          color: Colors.white, isUserId: true, bottomLength: bottomLength),
    );
  }

  privacyPolicyAndFPassword({double screenWidth}) {
    return (title == "LOGIN")
        ? Container(
            width: screenWidth,
            margin: EdgeInsets.only(right: 30),
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          )
        : Container(
            width: screenWidth,
            margin: EdgeInsets.only(right: 30),
            alignment: Alignment.centerRight,
            child: CheckboxListTile(
              title: Text("Agree to our Terms & Conditions",
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {},
              value: true,
            ),
          );
  }
}
