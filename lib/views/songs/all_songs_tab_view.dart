import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/view_models/all_songs_view_model.dart';
import '../../common_widgets/all_songs_tab_view_list_item.dart';
import '../main_player/main_player_view.dart';

class AllSongsTabView extends StatefulWidget {
  const AllSongsTabView({super.key});

  @override
  State<AllSongsTabView> createState() => _AllSongsTabViewState();
}

class _AllSongsTabViewState extends State<AllSongsTabView> {

  final allSongsVM = Get.put(AllSongsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
          ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: allSongsVM.allList.length,
              itemBuilder: (context, index) {
                var songsObj = allSongsVM.allList[index];
                return AllSongsTabListItem(
                  recentlyPlaySongs: songsObj,
                  onItemPress: () {},
                  onPlayBtnPressed: () {
                    Get.to(() => const MainPlayerView());
                  },);
              }
          )),
    );
  }
}
