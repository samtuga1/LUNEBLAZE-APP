import 'package:flutter/material.dart';

class GetListTile extends StatelessWidget {
  const GetListTile({
    Key? key,
    this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final IconData? icon;
  final String title;
  final String? subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap, //This triggers the onTap function that is being passed as a parameter
      child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(
            subtitle ?? '',
            style: TextStyle(color: Colors.black54),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )),
    );
  }
}
