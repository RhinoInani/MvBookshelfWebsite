import 'package:bookshelf_website/components/navbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    currentScreen = "aboutus";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "About Us",
      child: Scaffold(
        appBar: navbar(size, context),
        body: ListView.builder(
          itemCount: headerAboutUs.length,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.05,
          ),
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Column(
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
                        "The Monta Vista Bookshelf is a safe, accepting environment for reading enthusiasts of all backgrounds to cultivate their passion. We aim to embrace diversity and create belonging, recognizing that it results in the best ideas. As pioneers who identify new opportunities and ways of operating, we aspire to deliver on our plans.",
                    imagePath: 'assets/aboutUs1.png',
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
                        "Club activities range from active, intellectual in-club reading discussions about short stories and novels that focus on social justice issues and fiction. Additionally, we host writing workshops with prestigious mentors, guest speaker panels with accomplished professionals in the writing and publishing fields, as well as immersion opportunities with the book community through book drives and book fairs.",
                    imagePath: 'assets/aboutUs2.png',
                    flipped: true,
                    headerText: 'Events',
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: secondColor,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Our Team",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          fontSize: size.longestSide * 0.024,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                    child: AboutUsCard(
                      size: size,
                      imageHeight: size.height * 0.25,
                      imageWidth: size.width * 0.25,
                      bodyText: textAboutUs[index],
                      imagePath: imageAboutUs[index],
                      flipped: true,
                      headerText: headerAboutUs[index],
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                child: AboutUsCard(
                  size: size,
                  imageHeight: size.height * 0.25,
                  imageWidth: size.width * 0.25,
                  bodyText: textAboutUs[index],
                  imagePath: imageAboutUs[index],
                  flipped: index % 2 == 0 ? true : false,
                  headerText: headerAboutUs[index],
                ),
              );
            }
          },
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.longestSide * 0.005),
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.scaleDown,
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
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(size.longestSide * 0.005),
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.scaleDown,
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
                            fontWeight: FontWeight.bold,
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
