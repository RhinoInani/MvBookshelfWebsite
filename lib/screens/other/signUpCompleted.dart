import 'package:bookshelf_website/components/highlightButtonStyle.dart';
import 'package:bookshelf_website/components/navbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpCompleted extends StatelessWidget {
  const SignUpCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: navbar(size, context),
      body: Container(
        height: size.height - size.height * 0.08,
        width: size.width,
        decoration: new BoxDecoration(
          color: mainColor.withOpacity(0.2),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              mainColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            image: AssetImage('assets/bookshelfBackground3.jpeg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Thank you $recentSignUp for signing up!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: secondColor,
                    decorationThickness: 0.7,
                    color: mainColor,
                    fontSize: size.longestSide * 0.034,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "We are excited to see you soon in the upcoming Bookshelf Meeting! \nLook out for more details in your email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontSize: size.longestSide * 0.014,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Text(
                  "If you have any questions please reach out to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontSize: size.longestSide * 0.014,
                  ),
                ),
                Text(
                  "the.mvbookshelf.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainColor,
                    decorationColor: secondColor,
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.7,
                    fontSize: size.longestSide * 0.017,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: size.longestSide * 0.015,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
