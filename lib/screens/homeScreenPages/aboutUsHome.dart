import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AboutUsHome extends StatelessWidget {
  const AboutUsHome({
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
            Crab(
              tag: "text",
              flightShuttleBuilder: textFlightShuttleBuilder,
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: size.longestSide * 0.04,
                      color: mainColor,
                    ),
                    children: [
                      TextSpan(
                          text: "About ",
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
            SizedBox(
              height: size.height * 0.04,
            ),
            Flex(
              direction: size.width < 450 ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarText(
                  size: size,
                  text:
                      "The Monta Vista Bookshelf is a safe, accepting environment for reading enthusiasts of all backgrounds to cultivate their passion. We aim to embrace diversity and create belonging, recognizing that it results in the best ideas. As pioneers who identify new opportunities and ways of operating, we aspire to deliver on our plans.",
                  image: "aboutUs1.png",
                ),
                SizedBox(
                  height: size.height * 0.04,
                  width: size.width * 0.04,
                ),
                AvatarText(
                  size: size,
                  text:
                      "Club activities range from active, intellectual in-club reading discussions about short stories and novels that focus on social justice issues and fiction. Additionally, we host writing workshops with prestigious mentors, guest speaker panels with accomplished professionals in the writing and publishing fields, as well as immersion opportunities with the book community through book drives and book fairs.",
                  image: "aboutUs2.png",
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
          image: AssetImage('assets/bookshelfBackground2.jpeg'),
        ),
      ),
    );
  }
}

class AvatarText extends StatelessWidget {
  const AvatarText({
    Key? key,
    required this.size,
    required this.image,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      CircleAvatar(
        radius: size.longestSide * 0.07,
        child: Image.asset(
          'assets/$image',
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(
        width: size.width * 0.03,
        height: size.height * 0.03,
      ),
      Container(
        width: size.width < 450 ? size.width * 0.4 : size.width * 0.3,
        child: Text(
          "$text",
          textAlign: image == "aboutUs2.png" ? TextAlign.right : TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: size.longestSide * 0.013,
          ),
        ),
      ),
    ];

    return Flex(
      direction: size.width < 450 ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: image == "aboutUs2.png" ? children : children.reversed.toList(),
    );
  }
}
