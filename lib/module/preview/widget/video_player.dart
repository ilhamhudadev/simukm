import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/preview/controller/preview_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String url;

  VideoPlayerWidget({required this.url});

  @override
  Widget build(BuildContext context) {
    PreviewController controller = Get.find();
    controller.init(url);
    if (controller.videoPlayerController.value.isInitialized) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: controller.videoPlayerController.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(controller.videoPlayerController),
                VideoProgressIndicator(
                  controller.videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.grey,
                    backgroundColor: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () {
                        if (controller.isPlaying.value) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      },
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text('1x'),
                          onPressed: () {
                            controller.changePlaybackSpeed(1.0);
                          },
                        ),
                        TextButton(
                          child: Text('1.5x'),
                          onPressed: () {
                            controller.changePlaybackSpeed(1.5);
                          },
                        ),
                        TextButton(
                          child: Text('2x'),
                          onPressed: () {
                            controller.changePlaybackSpeed(2.0);
                          },
                        ),
                      ],
                    ),
                    Text(
                      '${controller.position.value.inSeconds} / ${controller.duration.value.inSeconds}',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Slider(
            min: 0,
            max: controller.duration.value.inSeconds.toDouble(),
            value: controller.position.value.inSeconds.toDouble(),
            onChanged: (value) {
              controller.seekTo(Duration(seconds: value.toInt()));
            },
          ),
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
