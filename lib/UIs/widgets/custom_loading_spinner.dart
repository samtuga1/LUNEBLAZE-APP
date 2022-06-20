import 'package:flutter/material.dart';

class CustomLoadingSpinner extends StatelessWidget {
  const CustomLoadingSpinner({Key? key, required this.loadingText})
      : super(key: key);
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
            Text(
              loadingText,
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
