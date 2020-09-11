import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double height;

  const CustomAppBar({Key key, this.title, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      flexibleSpace: Image(
        image: AssetImage('Purple-Space.jpg'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
