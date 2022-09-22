import 'package:flutter/material.dart';

import '../constants.dart';

BoxDecoration buildBackgroundColorFilter(String image) {
  return BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      colorFilter: new ColorFilter.mode(
        mainColor.withOpacity(0.3),
        BlendMode.dstIn,
      ),
      image: AssetImage('assets/$image'),
    ),
  );
}
