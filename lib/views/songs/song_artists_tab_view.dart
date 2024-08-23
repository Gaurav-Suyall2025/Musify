import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/common_widgets/songs_artist_list_item.dart';
import '../../view_models/artists_view_model.dart';
import 'artist_details_view.dart';

class SongsArtistsTabView extends StatefulWidget {
  const SongsArtistsTabView({super.key});

  @override
  State<SongsArtistsTabView> createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<SongsArtistsTabView> {
  final artVM = Get.put(ArtistsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            itemCount: artVM.allList.length,
            itemBuilder: (context, index) {
              var aObj = artVM.allList[index];

              return SongsArtistListItem(
                aObj: aObj,
                onPressed: () {
                  Get.to(() => const ArtistDetailsView());
                },
                onPressedMenuSelect: (selectIndex) {},
              );
            }),
      ),
    );
  }
}
