import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late List<VideoPlayerController> videoController;
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    videoController = [
      VideoPlayerController.network(
          "https://v53.tiktokcdn.com/7168499f814fb21ef1e2c43113f47e18/6148d36a/video/tos/useast2a/tos-useast2a-pve-0037-aiso/00f678a8b7c24b01b756007b65f10e63/?a=1180&br=2320&bt=1160&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=3&ds=3&er=&ft=98ZmFe154kag3&l=202109201230510102451292072F60DCF7&lr=tiktok&mime_type=video_mp4&net=0&pl=0&qs=0&rc=ajRlbzo6Zm87NzMzZjgzM0ApNzdnMzhpNmU3NzRlOjhkNGdrb25tcjRnYTFgLS1kL2Nzc2NjXmFfMTEzNGMuNWMvMzM6Yw%3D%3D&vl=&vr="),
      VideoPlayerController.network(
          "https://v9-id.tiktokcdn.com/91f2b69cc87a4295760cdcfd33d646e7/6148d366/video/tos/alisg/tos-alisg-pve-0037c001/19d9faf2695a463bbe0759e0025e081a/?a=1340&br=2220&bt=1110&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=SfCcoe154kag3&l=202109201230510102451292072F60DCF7&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=amhrOzQ6ZjpxODMzODczNEApZDU3Mzg2PGRnNzM6NzM8NGdkXy9lcjRnNi9gLS1kMS1zcy40NDYtM2EtNjFjYGJgY146Yw%3D%3D&vl=&vr="),
      VideoPlayerController.network(
          "https://v9-id.tiktokcdn.com/f6f807fd9cb1dd9dbd35c06fc383d82e/6148d370/video/tos/useast2a/tos-useast2a-pve-0037-aiso/fb9109818ec148ed8d5cf4eb75be569c/?a=1180&br=2616&bt=1308&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=3&ds=3&er=&ft=98ZmFe154kag3&l=20210920123057010245133207466477D8&lr=tiktok&mime_type=video_mp4&net=0&pl=0&qs=0&rc=amlqbmQ6ZmVrNzMzZjgzM0ApOzZoZjQ3OTxkNzVoODg4OWdrLW0ycjRnaGpgLS1kL2Nzc2MuYmNjX2ExNWBfMmAyNmE6Yw%3D%3D&vl=&vr="),
    ];
    pageController = PageController(initialPage: 0);
    initialVideoController(0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> initialVideoController(index) async {
    await Future.wait([
      videoController[index].initialize(),
      videoController[index].play(),
      videoController[index].setLooping(true)
    ]);
    update();
  }

  @override
  void onClose() {
    for (var element in videoController) {
      element.dispose();
    }
  }
}
