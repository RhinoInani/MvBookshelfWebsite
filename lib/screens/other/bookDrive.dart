import 'package:bookshelf_website/components/navbar.dart';
import 'package:bookshelf_website/screens/navBarPages/upcomingEvents.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BookDrive extends StatefulWidget {
  const BookDrive({Key? key}) : super(key: key);

  @override
  State<BookDrive> createState() => _BookDriveState();
}

class _BookDriveState extends State<BookDrive> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: navbar(size, context),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            itemCount: bookDriveFaqQuestions.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Text(
                      "Book Drive",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: size.longestSide * 0.024,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(size.longestSide * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.8,
                      child: Column(
                        children: [
                          Text(
                            "Dates: October 25th (Monday) to October 29th (Friday)\n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.longestSide * 0.015,
                            ),
                          ),
                          Text(
                            "Drop-off location: Room B211 OR Library",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.longestSide * 0.015,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.all(size.longestSide * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.8,
                      child: Column(
                        children: [
                          Text(
                            "Please email mv.thebookshelf@gmail.com or Instagram DM @mvbookshelf with any questions.)\n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.longestSide * 0.015,
                            ),
                          ),
                          Text(
                            "We await and appreciate your donation to bring the joy of reading to more students like us!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.longestSide * 0.015,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently Asked Questions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            fontSize: size.longestSide * 0.017,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    UpcomingEventsCard(
                      date: '',
                      bodyText: "${bookDriveFaqAnswers[0]}",
                      buttonPress: () {},
                      button: false,
                      title: '${bookDriveFaqQuestions[0]}',
                      size: size,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    UpcomingEventsCard(
                      date: '',
                      bodyText: "${bookDriveFaqAnswers[index]}",
                      buttonPress: () {},
                      button: false,
                      title: '${bookDriveFaqQuestions[index]}',
                      size: size,
                    ),
                  ],
                );
              }
            }));
  }
}
