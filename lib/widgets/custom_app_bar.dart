import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid_corner/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var title = "COVID CORNER";
    return AppBar(
      title: Text(title),
      backgroundColor: Palette.lightGreen,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomAppBarNews extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var title = "COVID CORNER: News";
    return AppBar(
      title: Text(title),
      backgroundColor: Palette.lightGreen,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomAppBarStats extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var title = "COVID CORNER: Statistics";
    return AppBar(
      title: Text(title),
      backgroundColor: Palette.lightGreen,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
