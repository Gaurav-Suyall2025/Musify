import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/color_extension.dart';

class RecentlyPlayedListItemView extends StatelessWidget {
  final Map recentlyPlaySongs;
  final VoidCallback onPlayBtnPressed;
  final VoidCallback onItemPress;

  const RecentlyPlayedListItemView(
      {super.key,
      required this.recentlyPlaySongs,
      required this.onItemPress,
      required this.onPlayBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onPlayBtnPressed,
                icon: Image.asset(
                  "assets/img/play_btn.png",
                  width: 25,
                  height: 25,
                )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentlyPlaySongs["name"],
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.primaryText80,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recentlyPlaySongs["artists"],
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                )
              ],
            )),
            Column(
              children: [
                Image.asset(
                  "assets/img/fav.png",
                  width: 12,
                  height: 12,
                ),
                const SizedBox(
                  height: 4,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: TColor.org.withOpacity(0.2),
                    itemCount: 5,
                    itemSize: 12,
                    itemPadding: EdgeInsets.zero,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: TColor.org,
                    ),
                    updateOnDrag: false,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                )
              ],
            )
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 50,
        ),
      ],
    );
  }
}
