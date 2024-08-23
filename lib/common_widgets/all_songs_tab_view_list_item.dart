import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class AllSongsTabListItem extends StatelessWidget {

  final Map recentlyPlaySongs;
  final VoidCallback onPlayBtnPressed;
  final VoidCallback onItemPress;

  const AllSongsTabListItem(
      {super.key, required this.recentlyPlaySongs, required this.onItemPress, required this.onPlayBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    recentlyPlaySongs["image"],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColor.primaryText28),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: TColor.bg,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recentlyPlaySongs["name"],
                      maxLines: 1,
                      style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      recentlyPlaySongs["artists"],
                      maxLines: 1,
                      style: TextStyle(color: TColor.primaryText28, fontSize: 10),
                    )
                  ],
                )),
            IconButton(
              onPressed: onPlayBtnPressed,
              icon: Image.asset(
                "assets/img/play_btn.png",
                width: 25,
                height: 25,
              ),
            ),
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
