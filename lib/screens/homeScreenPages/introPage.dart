import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookshelf_website/components/highlightButtonStyle.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

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
            Crab(
              tag: "text",
              child: Container(
                width: widget.size.width * 0.33,
                height: widget.size.height * 0.1,
                child: Row(
                  children: [
                    Text(
                      "Mv ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: widget.size.width * 0.045,
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.01,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: widget.size.width * 0.045,
                        color: mainColor,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Bookshelf",
                            speed: Duration(milliseconds: 600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // RichText(
                //   text: TextSpan(
                //       style: TextStyle(
                //           fontSize: size.width * 0.045, color: mainColor),
                //       children: [
                //         TextSpan(
                //             text: "Mv",
                //             style: TextStyle(
                //               color: Colors.white70,
                //             )),
                //         TextSpan(
                //           text: " Bookshelf",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ]),
                // ),
              ),
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
                    Navigator.of(context).pushNamed('/about-us');
                  },
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: widget.size.width * 0.013,
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
                  onPressed: () {},
                  child: Text(
                    "Join Us",
                    style: TextStyle(
                      fontSize: widget.size.width * 0.013,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
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
                )
              ],
            ),
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
