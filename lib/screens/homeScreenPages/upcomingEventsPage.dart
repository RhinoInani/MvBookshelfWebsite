import 'package:bookshelf_website/components/highlightButtonStyle.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UpcomingEventsPage extends StatelessWidget {
  const UpcomingEventsPage({
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Crab(
                  tag: "text",
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  child: Container(
                    width: size.longestSide * 0.3,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: size.longestSide * 0.04,
                            color: mainColor,
                          ),
                          children: [
                            TextSpan(
                                text: "Constant ",
                                style: TextStyle(
                                  color: Colors.white70,
                                )),
                            TextSpan(
                              text: "Events",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.longestSide * 0.015,
                ),
                Container(
                  width: size.longestSide * 0.3,
                  child: Text(
                    "We regularly host events, including author talks, book drives, essay writing sessions, and fundraising for local bookstores. As a Bookshelf member, you will have the opportunity to lead and participate in these projects!",
                    textAlign: TextAlign.center,
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
                    "Recent Events",
                    style: TextStyle(
                      fontSize: size.width * 0.013,
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
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/resources/meeting-notes');
                  },
                  child: Text(
                    "Meeting Notes",
                    style: TextStyle(
                      fontSize: size.width * 0.013,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
                ),
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
          image: AssetImage('assets/bookshelfBackground3.jpeg'),
        ),
      ),
    );
  }
}
