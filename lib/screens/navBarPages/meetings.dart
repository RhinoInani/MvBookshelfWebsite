import 'package:bookshelf_website/components/navbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Meetings extends StatefulWidget {
  const Meetings({Key? key}) : super(key: key);

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  List<String> months = [
    "October",
    "November",
    "December",
    "January",
    "February",
    "March",
    "April",
    "May",
  ];

  List<String> details = [
    "Social justice short story exploration. \n\nIntroduction of short story contest with La Pluma",
    "Short story writing workshops with mentors from the Society of Young Inklings.",
    "None: good luck with finals!",
    "Potential journalist guest speaker!",
    "African American author panel.",
    "March madness book exchange",
    "AP Lit/Lang tips and tricks exchange session/cram session",
    "None: good luck with AP Exams!",
  ];

  @override
  void initState() {
    currentScreen = "meetings";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "Meetings",
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: navbar(size, context),
        body: Container(
          decoration: new BoxDecoration(
            color: mainColor.withOpacity(0.2),
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                mainColor.withOpacity(0.1),
                BlendMode.dstATop,
              ),
              image: AssetImage('assets/bookshelfBackground1.jpeg'),
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: Text(
                          "Meetings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            fontSize: size.longestSide * 0.024,
                          ),
                        ),
                      ),
                      Divider(
                        color: secondColor,
                        endIndent: size.width * 0.08,
                        indent: size.width * 0.08,
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                    vertical: size.height * 0.05,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MonthlyAgenda(
                          size: size,
                          month: months[index],
                          details: details[index],
                        );
                      },
                      childCount: details.length,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MonthlyAgenda extends StatelessWidget {
  const MonthlyAgenda({
    Key? key,
    required this.size,
    required this.month,
    required this.details,
  }) : super(key: key);

  final Size size;
  final String month;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.15,
      padding: EdgeInsets.all(size.longestSide * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: mainColor,
          )),
      child: Column(
        children: [
          Text(
            "$month",
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
              fontSize: size.longestSide * 0.02,
            ),
          ),
          Divider(
            color: secondColor,
            endIndent: 5,
            indent: 5,
          ),
          Text(
            "$details",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: secondColor,
              fontSize: size.longestSide * 0.013,
            ),
          ),
        ],
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
