// ignore_for_file: deprecated_member_use, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class OrginalButton extends StatelessWidget {
  final String text;
  final VoidCallback Onpressed;
  final Color textColor;
  final Color bgColor;

  const OrginalButton(
      {Key? key,
      required this.text,
      required this.Onpressed,
      required this.textColor,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        color: bgColor,
        onPressed: Onpressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
