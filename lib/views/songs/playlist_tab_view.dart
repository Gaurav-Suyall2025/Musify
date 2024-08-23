import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:musify/common_widgets/view_all.dart';
import 'package:musify/view_models/playlists_view_model.dart';

import '../../common_widgets/playlist_songs_list_item.dart';
import '../../common_widgets/playlist_tab_view_list_item.dart';

class PlaylistsTabView extends StatefulWidget {
  const PlaylistsTabView({super.key});

  @override
  State<PlaylistsTabView> createState() => _AllSongsTabViewState();
}

class _AllSongsTabViewState extends State<PlaylistsTabView> {

  final playListVM = PlaylistsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Obx(() =>
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0
                    ),
                    itemCount: playListVM.playlistArr.length,
                    itemBuilder: (context, index) {
                      var pObj = playListVM.playlistArr[index];
                      return PlaylistSongsCell(
                        pObj: pObj,
                        onPressed: () {},
                        onPressedPlay: () {},
                      );
                    })),


            ViewAllSection(title: "My Playlists", onBtnPressed: () {}),
            SizedBox(height: 150,
              child: Obx(() =>
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: playListVM.myPlaylistArr.length,
                      itemBuilder: (context, index) {
                        var playListObj = playListVM.myPlaylistArr[index];
                        return PlayListTabListItem(
                          recentlyPlaySongs: playListObj,
                          onItemPress: () {},
                          onPlayBtnPressed: () {},);
                      }
                  )),)
          ],
        ),
      ),
    );
  }
}