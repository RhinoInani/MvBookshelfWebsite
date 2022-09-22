import 'dart:ui';

import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

const mainColor = Color(0xff5D6F5A);
const secondColor = Color.fromRGBO(51, 51, 51, 1);

List<String> meetingNotesBody = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
];

List<String> meetingNotesDate = [
  "8/20/21",
  "8/27/21",
];

List<String> meetingNotesTitle = [
  "First Meeting",
  "Second Meeting",
];

/// these images are not available on github for privacy reasons
/// thank you for understanding
List<String> imageAboutUs = [
  "assets/people/tvisha.png",
  "assets/people/june.jpeg",
  "assets/people/iona.jpeg",
  "assets/people/anna.jpeg",
  "assets/people/mulyn.jpeg",
  "assets/people/lavinia.jpeg",
  "assets/people/rohin.jpeg",
];

List<String> textAboutUs = [
  "Tvisha is a senior who fell in love with reading and literature when she was a little girl. An avid reader whose favorite genres include thriller and sci-fi, Tvisha is always on the lookout for her next read. She’s been part of and led various book clubs in the past, including ones at the Cupertino Library, her middle school, and her elementary school in India. Some of her favorite novels include Every Last Word and This is Our Story. When she’s not reading a book, Tvisha manages a book review website, competes as part of her school’s Speech and Debate team, and goes to the gym.",
  "June is excited to serve as Bookshelf's Vice President. While she is a lover of all cultures and paralleling literature, she consistently turns to mythology and dramatic short stories as her comfort reads. In her free time, she virtually browses art collections (her favorite being those exploring identity from The Museum of Modern Art in Manhattan) and tries her best to explore the unspoken through dance.",
  "Iona Xia, and is a senior at Monta Vista.  Iona is the Secretary/Treasurer of MV Bookshelf.  She love reading books and writing short stories in my free time!  She's excited to work with everyone this year!",
  "Anna is currently a senior and MV Bookshelf’s social media manager. At Monta Vista, she is a member of the varsity field hockey team and is a sports editor for El Estoque. In her free time, she enjoys playing the piano, watching sunrises, and reading memoirs.",
  "Mulyn and is the project manager of the Monta Vista Bookshelf Club. Shes a huge reader and currently working on writing a fantasy novel of my own in my free time!",
  "Lavinia Lei is the Bookshelf’s curriculum head. She enjoys reading all sorts of books (read: fiction), yet her choice genre might just be realistic fiction. Then again, despite being a senior in high school, her favorite book is The Tale of Despereaux; perhaps children’s fantasy is her real number one choice deep down inside. She thinks that reading is underrated and that books are cool, but she is of the humble opinion that PTJ webtoons happen to be the very best. Books are still very cool, though.",
  "Rohin Inani is a senior and is Mv bookshelf's Web Manager. He loves to read more adventures and fictional books, but also like his share of educational books and stories. In my free time he is a member of the Monta Vista Tennis Team, and also spends a lot of time coding. He also loves to play the guitar, euphonium, and spend time outside with family and friends. If you ever have any questions about anything web related you should go to him."
];

List<String> headerAboutUs = [
  "Tvisha Gupta - President",
  "June Wang - Vice President",
  "Iona Xia - Secretary/Treasurer",
  "Anna Jerolimov - Director of Marketing",
  "Mulyn Kim - Director of Projects",
  "Lavinia Lei - Director of Content",
  "Rohin Inani - Director of Web Dev",
];

String recentSignUp = "";

Widget textFlightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  BeachTransitionDirection direction,
  BuildContext fromCrabContext,
  BuildContext? toCrabContext,
) {
  final curvedAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: 0,
        left: 0,
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(curvedAnimation),
          child: (fromCrabContext.widget as Crab).child,
        ),
      ),
      if (toCrabContext != null)
        Positioned(
          top: 0,
          left: 0,
          child: FadeTransition(
            opacity: curvedAnimation,
            child: (toCrabContext.widget as Crab).child,
          ),
        ),
    ],
  );
}

String currentScreen = "home";

List<String> bookDriveFaqQuestions = [
  "Should we make an appointment to drop off books?",
  "Is there any restriction on what type of books and the quality of books we can donate?",
  "Which organization are the books being donated to?",
  "What’s the drop off process?",
  "Who do we contact if we have questions?",
];

List<String> bookDriveFaqAnswers = [
  "Nope! Anytime during the week of October 25th (10/25 - 10/29), just drop off your books in the library or Room B211. There will be designated boxes where donations can be placed. If you can’t find the boxes, kindly ask the librarian or Ms. Rose!",
  "The books donated can range from old to new. However, the book needs to be intact; the books should not have broken bindings, ripped pages, water damage, etc. Additionally, the books should also be school appropriate as we are donating these to a charity that aids homeless families.",
  "We are donating the books to Hamilton Families, a charity that helps Bay Area families move out of homelessness and aid their transition :)).",
  "You can either drop your used/new books off in B211 during our meeting on Monday, October 25th, or throughout the week (10/25 - 10/29) into the boxes labeled for the book drive in the library.",
  "Email mv.thebookshelf@gmail.com or DM @mvbookshelf with any questions!",
];
