import 'package:bookshelf_website/configure_web.dart';
import 'package:bookshelf_website/screens/homeScreenPages/biWeeklyReadingsPage.dart';
import 'package:bookshelf_website/screens/homeScreenPages/contactUsPage.dart';
import 'package:bookshelf_website/screens/homeScreenPages/introPage.dart';
import 'package:bookshelf_website/screens/homeScreenPages/upcomingEventsPage.dart';
import 'package:bookshelf_website/screens/navBarPages/aboutUs.dart';
import 'package:bookshelf_website/screens/navBarPages/joinUs.dart';
import 'package:bookshelf_website/screens/navBarPages/resources.dart';
import 'package:bookshelf_website/screens/navBarPages/upcomingEvents.dart';
import 'package:bookshelf_website/screens/other/meetingNotes.dart';
import 'package:bookshelf_website/screens/other/pageNotFound.dart';
import 'package:bookshelf_website/screens/other/signUpCompleted.dart';
import 'package:coast/coast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/navbar.dart';
import 'configure_web.dart';
import 'constants.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/about-us': (context) => AboutUs(),
        '/events': (context) => UpcomingEvents(),
        '/join': (context) => JoinUs(),
        '/join/thank-you': (context) => SignUpCompleted(),
        '/resources': (context) => Resources(),
        '/resources/meeting-notes': (context) => MeetingNotes(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return PageNotFound();
        });
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: mainColor,
            opacity: 0.9,
          ),
        ),
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _coastController = CoastController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: navbar(size, context),
      body: Title(
        color: Colors.white,
        title: "Mv Bookshelf",
        child: Coast(
          controller: _coastController,
          scrollDirection: Axis.vertical,
          dragStartBehavior: DragStartBehavior.down,
          beaches: [
            Beach(builder: (context) => IntroPage(size: size)),
            Beach(builder: (context) => BiWeeklyReadingsPage(size: size)),
            Beach(builder: (context) => UpcomingEventsPage(size: size)),
            Beach(builder: (context) => ContactUsPage(size: size)),
          ],
          observers: [
            CrabController(),
            CrabController(),
            CrabController(),
            CrabController(),
          ],
        ),
      ),
    );
  }
}
