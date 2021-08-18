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
                  child: Container(
                    width: size.width * 0.35,
                    height: size.height * 0.1,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.075,
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
                  width: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.3,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
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
                  onPressed: () {},
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
