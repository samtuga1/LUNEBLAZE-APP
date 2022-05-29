import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends BaseViewModel {
  //This method returns the ListTile that is being used in the Settings view class
  InkWell getListTile(
      IconData? icon, String? title, String? subtitle, Function() onTap) {
    return InkWell(
      onTap:
          onTap, //This triggers the onTap function that is being passed as a parameter
      child: ListTile(
          leading: Icon(icon),
          title: Text(title!),
          subtitle: Text(subtitle!),
          trailing: Icon(Icons.arrow_forward_ios)),
    );
  }

//This also returns the header
  String header(String headerTitle) {
    return headerTitle;
  }
}
