import 'package:bookshelf_website/components/navbar.dart';
import 'package:bookshelf_website/constants.dart';
import 'package:flutter/material.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  _UpcomingEventsState createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "Upcoming Events",
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
                    "Upcoming Events",
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
              UpcomingEventsCard(
                size: size,
                title: "Weekly Meetings",
                bodyText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                date: "Every other Monday during Lunch",
                button: false,
                buttonPress: () {},
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              UpcomingEventsCard(
                size: size,
                title: "Book Drive",
                bodyText:
                    "The MV Bookshelf is hosting a book drive, during the week of October 25th (10/25 - 10/29). Come and drop off your books in the library or Mrs. Rose's Room (B211).",
                date: "Week of October 25th",
                buttonPress: () {
                  Navigator.of(context).pushNamed('/book-drive');
                },
                button: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpcomingEventsCard extends StatelessWidget {
  const UpcomingEventsCard({
    Key? key,
    required this.size,
    required this.title,
    required this.bodyText,
    required this.date,
    required this.button,
    required this.buttonPress,
  }) : super(key: key);

  final Size size;
  final String title;
  final String bodyText;
  final String date;
  final bool button;
  final Function buttonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width * 0.7,
                    child: Text(
                      "$title",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: size.longestSide * 0.017,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  date == ''
                      ? Container()
                      : Text(
                          "$date",
                          style: TextStyle(
                            color: secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.longestSide * 0.01,
                          ),
                        ),
                ],
              ),
              Spacer(),
              button
                  ? OutlinedButton(
                      onPressed: () {
                        buttonPress.call();
                      },
                      child: Text(
                        "More information",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: size.longestSide * 0.01,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(color: mainColor),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              "$bodyText",
              style: TextStyle(fontSize: size.longestSide * 0.012),
            ),
          ),
        ],
      ),
    );
  }
}
