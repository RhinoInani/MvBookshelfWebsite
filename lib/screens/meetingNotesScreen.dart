import 'package:bookshelf_website/components/navbar.dart';
import 'package:bookshelf_website/constants.dart';
import 'package:bookshelf_website/screens/upcomingEventsScreen.dart';
import 'package:flutter/material.dart';

class MeetingNotes extends StatelessWidget {
  const MeetingNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.white,
      title: "Meeting Notes",
      child: Scaffold(
        appBar: navbar(size, context),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            itemCount: meetingNotesTitle.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
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
                    UpcomingEventsCard(
                        size: size,
                        title: "${meetingNotesTitle[index]}",
                        bodyText: "${meetingNotesBody[index]}",
                        date: "${meetingNotesDate[index]}"),
                  ],
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    UpcomingEventsCard(
                        size: size,
                        title: "${meetingNotesTitle[index]}",
                        bodyText: "${meetingNotesBody[index]}",
                        date: "${meetingNotesDate[index]}"),
                  ],
                );
              }
            }),
      ),
    );
  }
}
