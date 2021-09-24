import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromRGBO(191, 191, 191, 1),
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                ),
                label: "Discovery"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/tiktok_center.svg"), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/inbox_icon.svg"),
                label: "Inbox"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/me_icon.svg"), label: "Inbox"),
          ],
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return Stack(children: [
              PageView(
                  onPageChanged: (index) =>
                      controller.initialVideoController(index),
                  scrollDirection: Axis.vertical,
                  controller: controller.pageController,
                  children: controller.videoController.map((e) {
                    return e.value.isInitialized
                        ? VideoView(
                            controller: e,
                            publishBy: "@Fintory",
                            caption: "We build digital products.",
                            music: "Original sound - @Fintory",
                          )
                        : const Center(child: CircularProgressIndicator());
                  }).toList()),
              Padding(
                padding: EdgeInsets.only(top: 55.h),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Following  ",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  Container(width: 1.w, height: 12.h, color: Colors.white),
                  Text("  For You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700))
                ]),
              )
            ]);
          },
        ));
  }
}

class VideoView extends StatelessWidget {
  const VideoView(
      {Key? key,
      required this.controller,
      required this.publishBy,
      required this.caption,
      required this.music})
      : super(key: key);
  final VideoPlayerController controller;
  final String publishBy, caption, music;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: Get.width, height: Get.height, child: VideoPlayer(controller)),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        width: Get.width,
        height: Get.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(publishBy,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 9.h),
                Text(caption,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                SizedBox(height: 9.h),
                Row(children: [
                  SvgPicture.asset("assets/melody_icon.svg"),
                  SizedBox(width: 10.w),
                  Text(music,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                ])
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/profile.svg"),
                SizedBox(height: 33.h),
                const RightSidebar(
                    count: "17 M", imageAsset: "assets/like_icon.svg"),
                SizedBox(height: 23.h),
                const RightSidebar(
                    count: "17 M", imageAsset: "assets/comment_icon.svg"),
                SizedBox(height: 23.h),
                const RightSidebar(
                    count: "17 M", imageAsset: "assets/share_icon.svg"),
                SizedBox(height: 23.h),
                 SvgPicture.asset("assets/spin.svg"),
        
              ],
            )
          ],
        ),
      )
    ]);
  }
}

class RightSidebar extends StatelessWidget {
  const RightSidebar({Key? key, required this.count, required this.imageAsset})
      : super(key: key);
  final String count, imageAsset;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(imageAsset),
      SizedBox(height: 6.h),
      Text(count, style: TextStyle(color: Colors.white, fontSize: 12.sp)),
    ]);
  }
}
