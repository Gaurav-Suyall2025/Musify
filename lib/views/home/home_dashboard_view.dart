import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/common/color_extension.dart';
import 'package:musify/view_models/home_dash_view_model.dart';

import '../../common_widgets/playlist_list_item.dart';
import '../../common_widgets/recently_played_list_item.dart';
import '../../common_widgets/recommended_list_item.dart';
import '../../common_widgets/title_sections.dart';
import '../../common_widgets/view_all.dart';
import '../../view_models/splash_view_model.dart';

class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({super.key});

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {

  final homeDashboardVM = Get.put(HomeDashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Get.find<SplashViewModel>().openDrawer();
        },
            icon: Image.asset("assets/img/menu.png", width: 25,
              height: 25,
              fit: BoxFit.contain,)),

        title: Row(children: [
          Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xff292e48),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: TextField(
                  controller: homeDashboardVM.txtSearch.value,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 4,
                          horizontal: 20),
                      prefixIcon: Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        width: 30,
                        child: Image.asset("assets/img/search.png",
                          width: 20, height: 20, fit: BoxFit.contain,
                          color: TColor.primaryText28,),
                      ),
                      hintText: "Search album songs",
                      hintStyle: TextStyle(
                        color: TColor.primaryText28,
                        fontSize: 13,
                      )
                  ),
                ),
              )
          )
        ],),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(title: "Hot Recommended"),

            SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeDashboardVM.hostRecommendedArr.length,
                  itemBuilder: (context, index) {
                    var mObj = homeDashboardVM.hostRecommendedArr[index];
                    return RecommendedListViewItem(mObj: mObj);
                  }),
            ),

            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),

            ViewAllSection(
              title: "Playlist", btnTitle: "View All", onBtnPressed: () {},),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeDashboardVM.playListArr.length,
                  itemBuilder: (context, index) {
                    var mObj = homeDashboardVM.playListArr[index];
                    return PlayListViewItem(mObj: mObj);
                  }),
            ),


            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),

            ViewAllSection(title: "Recently Played",
              btnTitle: "View All",
              onBtnPressed: () {},),

              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: homeDashboardVM.recentlyPlayedArr.length,
                  itemBuilder: (context, index) {
                    var recentlyPlaySongs = homeDashboardVM
                        .recentlyPlayedArr[index];
                    return RecentlyPlayedListItemView(
                      recentlyPlaySongs: recentlyPlaySongs,
                      onItemPress: () {},
                      onPlayBtnPressed: () {},);
                  }),

          ],),
      ),
    );
  }
}
