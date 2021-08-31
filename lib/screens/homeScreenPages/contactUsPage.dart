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

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['mvbookshelf@gmail.com'],
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
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
                tag: "text",
                child: Container(
                  height: size.height * 0.18,
                  width: size.width * 0.3,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.075,
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
              height: size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    launchMailto();
                  },
                  icon: Icon(
                    Icons.email,
                    color: secondColor,
                  ),
                  iconSize: size.height * 0.04,
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
                  ),
                  iconSize: size.height * 0.04,
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
                  ),
                  iconSize: size.height * 0.04,
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
