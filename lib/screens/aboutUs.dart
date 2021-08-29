import 'package:bookshelf_website/components/navbar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "About Us",
      child: Scaffold(
        appBar: navbar(size, context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.05,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      fontSize: size.longestSide * 0.024,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AboutUsCard(
                size: size,
                imageHeight: size.height * 0.25,
                imageWidth: size.width * 0.25,
                bodyText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                imagePath: 'assets/bookshelfBackground4.jpeg',
                flipped: false,
                headerText: 'Meetings',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              AboutUsCard(
                size: size,
                imageHeight: size.height * 0.2,
                imageWidth: size.width * 0.25,
                bodyText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                imagePath: 'assets/bookshelfBackground3.jpeg',
                flipped: false,
                headerText: 'Events',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Divider(
                thickness: 0.5,
                color: secondColor,
              ),
              Padding(
                padding: EdgeInsets.all(size.longestSide * 0.02),
                child: Text(
                  "Our Team",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    fontSize: size.longestSide * 0.024,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({
    Key? key,
    required this.size,
    required this.imageHeight,
    required this.imageWidth,
    required this.bodyText,
    required this.imagePath,
    required this.flipped,
    required this.headerText,
  }) : super(key: key);

  final Size size;
  final double imageHeight;
  final double imageWidth;
  final String bodyText;
  final String imagePath;
  final bool flipped;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      child: flipped
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Text(
                    "$bodyText",
                    style: TextStyle(fontSize: size.longestSide * 0.012),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    '$imagePath',
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    '$imagePath',
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: size.longestSide * 0.017),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "$bodyText",
                        style: TextStyle(fontSize: size.longestSide * 0.012),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}