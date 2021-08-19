import 'package:bookshelf_website/components/navbar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Resources extends StatelessWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "Resources",
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
                    "Resources",
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
              ResourcesCard(
                size: size,
                destination: "/resources/meeting-notes",
                imagePath: 'assets/bookshelfBackground1.jpeg',
                title: "Meeting Notes",
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ResourcesCard(
                size: size,
                destination: "/resources/readings",
                imagePath: 'assets/bookshelfBackground2.jpeg',
                title: "Readings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResourcesCard extends StatelessWidget {
  const ResourcesCard({
    Key? key,
    required this.size,
    required this.destination,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final Size size;
  final String destination;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("$destination");
      },
      child: Container(
        padding: EdgeInsets.all(size.longestSide * 0.03),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor.withOpacity(0.2),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              mainColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            image: AssetImage("$imagePath"),
          ),
        ),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
              color: secondColor,
              fontSize: size.longestSide * 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
