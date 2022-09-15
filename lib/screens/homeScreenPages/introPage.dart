import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookshelf_website/components/highlightButtonStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height - widget.size.height * 0.08,
      width: widget.size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mv ",
                  style: GoogleFonts.quicksand(
                    color: Colors.white70,
                    fontSize: widget.size.longestSide * 0.055,
                  ),
                ),
                SizedBox(
                  width: widget.size.width * 0.01,
                ),
                DefaultTextStyle(
                  style: GoogleFonts.quicksand(
                    fontSize: widget.size.longestSide * 0.055,
                    color: mainColor,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Bookshelf",
                        speed: Duration(milliseconds: 400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: widget.size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    if (currentScreen != "aboutus") {
                      Navigator.of(context).pushNamed('/about-us');
                    }
                    currentScreen = "aboutus";
                  },
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: widget.size.longestSide * 0.015,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
                ),
                SizedBox(
                  width: widget.size.width * 0.02,
                ),
                OutlinedButton(
                  onPressed: () {
                    if (currentScreen != "join") {
                      Navigator.of(context).pushNamed('/join');
                    }
                    currentScreen = "join";
                  },
                  child: Text(
                    "Join Us",
                    style: TextStyle(
                      fontSize: widget.size.longestSide * 0.015,
                      backgroundColor: Colors.transparent,
                      color: Colors.white70,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused))
                        return secondColor;
                      if (states.contains(MaterialState.hovered))
                        return mainColor;
                      if (states.contains(MaterialState.pressed))
                        return mainColor;
                      return secondColor;
                    }),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: widget.size.height * 0.03,
            ),
            Container(
              width: widget.size.width * 0.4,
              child: FittedBox(
                child: Text(
                  widget.size.width < 450
                      ? "We can't wait to\n hear your story!"
                      : "We can't wait to hear your story!",
                  style: TextStyle(
                    color: secondColor,
                    fontSize: widget.size.longestSide * 0.05,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: mainColor.withOpacity(0.2),
        image: new DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
            mainColor.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          image: AssetImage('assets/bookshelfBackground1.jpeg'),
        ),
      ),
    );
  }
}
