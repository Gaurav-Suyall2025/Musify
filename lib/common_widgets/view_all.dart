import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ViewAllSection extends StatelessWidget {
  final String title;
  final String btnTitle;
  final VoidCallback onBtnPressed;

  const ViewAllSection(
      {super.key, required this.title, this.btnTitle = "View All",required this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Row(children: [
          Expanded(child: Text(
            title, style: TextStyle(color: TColor.primaryText80,
              fontSize: 15, fontWeight: FontWeight.w600),),),


          TextButton(onPressed: onBtnPressed, child: Text(
            btnTitle, style: TextStyle(color: TColor.org,
              fontSize: 11),))
        ],)
    );
  }
}