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
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: size.longestSide * 0.04,
                          color: mainColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Meeting Dates ",
                          ),
                          TextSpan(
                            text:
                                size.width < 450 ? "\n& Agendas" : "& Agendas",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
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
                      fontSize: size.longestSide * 0.015,
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
                  onPressed: () {
                    if (currentScreen != "meetings") {
                      Navigator.of(context).pushNamed('/meetings');
                    }
                    currentScreen = "meetings";
                  },
                  child: Text(
                    "Meetings",
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
