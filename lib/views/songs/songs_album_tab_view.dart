import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/common_widgets/songs_album_view_list_item.dart';
import 'package:musify/view_models/albums_view_model.dart';

import 'album_details_view.dart';

class SongsAlbumTabView extends StatefulWidget {
  const SongsAlbumTabView({super.key});

  @override
  State<SongsAlbumTabView> createState() => _SongsAlbumTabViewState();
}

class _SongsAlbumTabViewState extends State<SongsAlbumTabView> {

  final albumVM = Get.put(AlbumViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var cellWidth = (media.width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(() =>
          GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: cellWidth / (cellWidth + 60.0),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10),
              itemCount: albumVM.allList.length,
              itemBuilder: (context, index) {
                var albumObj = albumVM.allList[index];


                return SongsAlbumListItem(
                  mObj: albumObj,
                  onPressed: () {
                    Get.to(() => AlbumDetailsView());
                  },
                  onPressedMenu: (selectIndex) {
                    if (kDebugMode) {
                      // print(index);
                    }
                  },
                );
              })),
    );
  }
}