import 'package:flutter/material.dart';

import '../constants.dart';

ButtonStyle highlightButtonStyle() {
  return ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return secondColor;
      if (states.contains(MaterialState.hovered)) return mainColor;
      if (states.contains(MaterialState.pressed)) return mainColor;
      return secondColor;
    }),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}
