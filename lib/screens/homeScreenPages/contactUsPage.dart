import 'dart:html' as html;

import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  void _launchMailClient() async {
    const mailUrl = 'mailto:mv.thebookshelf@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

  Future<void> launchMailto() async {
    final mailtoLink = Mailto(
      to: [
        'the.mvbookshelf@gmail.com',
      ],
    );

    // await launch('$mailtoLink');
    html.window.open('$mailtoLink', "_blank");
  }

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
            Center(
              child: Crab(
                flightShuttleBuilder: textFlightShuttleBuilder,
                tag: "text",
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.3,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: size.longestSide * 0.037,
                            color: mainColor),
                        children: [
                          TextSpan(
                              text: "Contact\n",
                              style: TextStyle(
                                color: Colors.white70,
                              )),
                          TextSpan(
                            text: "Us",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.longestSide * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    // await launchMailto();
                    _launchMailClient();
                  },
                  icon: Icon(
                    Icons.email,
                    color: secondColor,
                    size: size.longestSide * 0.025,
                  ),
                  iconSize: size.longestSide * 0.025,
                  hoverColor: mainColor.withOpacity(0.3),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                IconButton(
                  onPressed: () {
                    html.window.open(
                        'https://www.instagram.com/mvbookshelf/', "_blank");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: secondColor,
                    size: size.longestSide * 0.025,
                  ),
                  iconSize: size.longestSide * 0.025,
                  hoverColor: mainColor.withOpacity(0.3),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                IconButton(
                  onPressed: () {
                    html.window.open(
                        'https://github.com/RhinoInani/MvBookshelfWebsite',
                        "_blank");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: secondColor,
                    size: size.longestSide * 0.025,
                  ),
                  iconSize: size.longestSide * 0.025,
                  hoverColor: mainColor.withOpacity(0.3),
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
          image: AssetImage('assets/bookshelfBackground4.jpeg'),
        ),
      ),
    );
  }
}
