import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';

class RecommendedListViewItem extends StatelessWidget {
  final Map mObj;

  const RecommendedListViewItem({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              mObj["image"],
              width: double.maxFinite,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Text(
            mObj["name"],
            maxLines: 1,
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),

          Text(
            mObj["artists"],
            maxLines: 1,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
