import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/songs_genre_list_item.dart';
import '../../view_models/genres_view_model.dart';

class SongGenresTabView extends StatefulWidget {
  const SongGenresTabView({super.key});

  @override
  State<SongGenresTabView> createState() => _GenresViewState();
}

class _GenresViewState extends State<SongGenresTabView> {

  final genVM = Get.put(GenresViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.4),
          itemCount: genVM.allList.length,
          itemBuilder: (context, index) {

            var cObj = genVM.allList[index];

            return SongsGenreListItem(
              cObj: cObj,
              onPressed: (){

              },
            );
          }),
    );
  }
}
