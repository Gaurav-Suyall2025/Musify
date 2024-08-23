import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/views/songs/all_songs_tab_view.dart';
import 'package:musify/views/songs/playlist_tab_view.dart';
import 'package:musify/views/songs/song_artists_tab_view.dart';
import 'package:musify/views/songs/song_genres_tab_view.dart';
import 'package:musify/views/songs/songs_album_tab_view.dart';
import '../../common/color_extension.dart';
import '../../view_models/splash_view_model.dart';

class SongsView extends StatefulWidget {
  const SongsView({super.key});

  @override
  State<SongsView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.find<SplashViewModel>().openDrawer();
          },
          icon: Image.asset(
            "assets/img/menu.png",
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Songs",
          style: TextStyle(
              color: TColor.primaryText80,
              fontSize: 17,
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true, // to center the title horizontally
        actions: [
          IconButton(
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
            },
            icon: Image.asset(
              "assets/img/search.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: TColor.primaryText35,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight - 15,
            child: TabBar(
              controller: controller,
              indicatorColor: TColor.focus,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              isScrollable: true,
              labelColor: TColor.focus,
              labelStyle: TextStyle(
                  color: TColor.focus,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: TColor.primaryText80,
              unselectedLabelStyle: TextStyle(
                  color: TColor.primaryText80,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              tabs: const [
                Tab(
                  text: "All Songs",
                ),
                Tab(
                  text: "Playlists",
                ),
                Tab(
                  text: "Albums",
                ),
                Tab(
                  text: "Artists",
                ),
                Tab(
                  text: "Genres",
                ),
              ],
            ),
          ),

          Expanded(child: TabBarView(
            controller: controller,
            children: [
              const AllSongsTabView(),
              const PlaylistsTabView(),
              const SongsAlbumTabView(),
              const SongsArtistsTabView(),
              const SongGenresTabView()
            ],
          ))

        ],
      ),
    );
  }
}
