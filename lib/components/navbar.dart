import 'package:flutter/material.dart';

import '../constants.dart';

AppBar navbar(Size size, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leadingWidth: size.width * 0.2,
    toolbarHeight: size.height * 0.08,
    leading: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: size.width * 0.05,
            ),
            Text(
              "Mv Bookshelf",
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: size.longestSide * 0.018,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      SizedBox(
        width: size.width * 0.01,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Text(
          "Home",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return secondColor;
            if (states.contains(MaterialState.hovered)) return mainColor;
            if (states.contains(MaterialState.pressed)) return mainColor;
            return secondColor;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/about-us');
        },
        child: Text(
          "About us",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return secondColor;
            if (states.contains(MaterialState.hovered)) return mainColor;
            if (states.contains(MaterialState.pressed)) return mainColor;
            return secondColor;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/events');
        },
        child: Text(
          "Upcoming Events",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return secondColor;
            if (states.contains(MaterialState.hovered)) return mainColor;
            if (states.contains(MaterialState.pressed)) return mainColor;
            return secondColor;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/resources');
        },
        child: Text(
          "Resources",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return secondColor;
            if (states.contains(MaterialState.hovered)) {
              return mainColor;
            }
            if (states.contains(MaterialState.pressed)) return mainColor;
            return secondColor;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/contact-us');
        },
        child: Text(
          "Contact Us",
          style: TextStyle(
            fontSize: size.longestSide * 0.013,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return secondColor;
            if (states.contains(MaterialState.hovered)) return mainColor;
            if (states.contains(MaterialState.pressed)) return mainColor;
            return secondColor;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
    ],
  );
}
