import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
