import 'package:get/get.dart';
import 'package:standard_project/module/preview/data/model/listing_video_model.dart';
import 'package:standard_project/module/preview/data/repo/preview_repo.dart';
import 'package:video_player/video_player.dart';

class PreviewController extends GetxController with PreviewRepo {
  // Fetch API

  Future<ListingVideoModel> futureDetailPreview() {
    return fetchListingVideo();
  }

  RxBool visibleItem = false.obs;
  RxString selectedItem = "0".obs;
  RxString videoURL =
      "https://video-ssl.itunes.apple.com/itunes-assets/Video118/v4/4a/40/a0/4a40a0b1-9403-64f9-1b86-da6edfb9c5d7/mzvf_7192500523742699525.640x352.h264lc.U.p.m4v"
          .obs;

  String getVideoURL() {
    return videoURL.value;
  }

  void setVideoURL(url) {
    videoURL.value = url;
  }

  String getSelectedItem() {
    return selectedItem.value;
  }

  void setSelectedItem(url) {
    selectedItem.value = url;
  }

  bool getVisibleItem() {
    return visibleItem.value;
  }

  void setVisibleItem(url) {
    visibleItem.value = url;
  }

  // video controller

  late VideoPlayerController videoPlayerController;

  RxBool isPlaying = false.obs;
  RxDouble playbackSpeed = 1.0.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = Duration.zero.obs;

  void init(String url) {
    videoPlayerController = VideoPlayerController.network(url);
    videoPlayerController.initialize().then((_) {
      duration.value = videoPlayerController.value.duration;
      update();
    });
    videoPlayerController.addListener(() {
      position.value = videoPlayerController.value.position;
    });
  }

  void play() {
    videoPlayerController.play();
    isPlaying.value = true;
  }

  void pause() {
    videoPlayerController.pause();
    isPlaying.value = false;
  }

  void changePlaybackSpeed(double speed) {
    videoPlayerController.setPlaybackSpeed(speed);
    playbackSpeed.value = speed;
  }

  void seekTo(Duration duration) {
    videoPlayerController.seekTo(duration);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
