import 'package:bookshelf_website/components/highlightButtonStyle.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BiWeeklyReadingsPage extends StatelessWidget {
  const BiWeeklyReadingsPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height - size.height * 0.08,
      width: size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Crab(
                  tag: "text",
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  child: Container(
                    width: size.longestSide * 0.24,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: size.longestSide * 0.04,
                            color: mainColor,
                          ),
                          children: [
                            TextSpan(
                                text: "Bi-Weekly\n",
                                style: TextStyle(
                                  color: Colors.white70,
                                )),
                            TextSpan(
                              text: "Readings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Container(
                  width: size.width < 300 ? size.width * 0.2 : size.width * 0.3,
                  child: Text(
                    "Along with traditional book discussions, we host activity meetings where YOU will have the opportunity to participate in creative writing, win fun prizes in book-related trivia competitions, and plan community-oriented activities.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.longestSide * 0.013,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Start Reading",
                    style: TextStyle(
                      fontSize: size.width * 0.013,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
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
          image: AssetImage('assets/bookshelfBackground2.jpeg'),
        ),
      ),
    );
  }
}
