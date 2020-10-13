import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  String title;

  TitleBar({this.title});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {}),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
          ),
        )
      ],
    );
  }
}
