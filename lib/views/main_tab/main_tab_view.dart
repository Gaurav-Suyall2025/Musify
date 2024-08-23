import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:musify/common/color_extension.dart';

import '../../common_widgets/icon_text_row.dart';
import '../../view_models/splash_view_model.dart';
import '../home/home_dashboard_view.dart';
import '../settings/settings_view.dart';
import '../songs/songs_view.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin{

  TabController? tabController;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3,vsync: this);

    tabController?.addListener(() {
      selectedTab = tabController?.index ?? 0 ;
      // debugPrint('This is a  tabController . ${selectedTab.toString()}');
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.sizeOf(context);

    var splashVM = Get.find<SplashViewModel>();

    return Scaffold(
      key: splashVM.scaffoldKey,
      drawer: Drawer(
          backgroundColor: const Color(0xff10121D),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 260,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: TColor.primaryText.withOpacity(0.03),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        "assets/img/musify_icon.png",
                        width: media.width * 0.3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "328\nSongs",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffC1C0C0), fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "52\nAlbums",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffC1C0C0), fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "87\nArtists",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffC1C0C0), fontSize: 12),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              IconTextRow(
                title: "Themes",
                icon: "assets/img/m_theme.png",
                onTap: () {},
              ),
              IconTextRow(
                title: "Ringtone Cutter",
                icon: "assets/img/m_ring_cut.png",
                onTap: () {},
              ),

              IconTextRow(
                title: "Sleep Timer",
                icon: "assets/img/m_sleep_timer.png",
                onTap: () {},
              ),
              IconTextRow(
                title: "Equalizer",
                icon: "assets/img/m_eq.png",
                onTap: () {},
              ),
              IconTextRow(
                title: "Driver Mode",
                icon: "assets/img/m_driver_mode.png",
                onTap: () {},
              ),

              IconTextRow(
                title: "Hidden Folders",
                icon: "assets/img/m_hidden_folder.png",
                onTap: () {},
              ),
              IconTextRow(
                title: "Scan Media",
                icon: "assets/img/m_scan_media.png",
                onTap: () {},
              ),
            ],
          )),
      body: TabBarView(controller: tabController,children: [
        Container(
          child: HomeDashboardView()
        ),
        Container(
            child: SongsView()
        ),
        Container(
            child: SettingsView()
        ),
      ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: TColor.bg,boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: Offset(0,-3)
          )
        ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          indicatorWeight: 1,
          labelColor: TColor.primary,
          labelStyle: const TextStyle(fontSize: 10),
          unselectedLabelColor: TColor.primaryText28,
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          onTap: (index) {
            setState(() {
              selectedTab = index;
              debugPrint('This is a  tabController  ${index.toString()} . ${selectedTab.toString()}');
            });
          },
          tabs: [
          Tab(text: "Home",icon: Image.asset(selectedTab == 0 ? "assets/img/home_tab.png" : "assets/img/home_tab_un.png",
            width: 20,height: 20,),),

          Tab(text: "Songs",icon: Image.asset(selectedTab == 1 ? "assets/img/songs_tab.png" : "assets/img/songs_tab_un.png",
            width: 20,height: 20,),),

          Tab(text: "Settings",icon: Image.asset(selectedTab == 2 ? "assets/img/setting_tab.png" : "assets/img/setting_tab_un.png",
            width: 20,height: 20,),)
        ],)),
      ),
    );
  }
}
