import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/preview/controller/preview_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({
    super.key,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  PreviewController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(controller.getVideoURL());
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      setState(() {
        _isPlaying = !_isPlaying;
      });
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _fastForward() {
    setState(() {
      final Duration position = _controller.value.position;
      final Duration duration = _controller.value.duration;
      const Duration fastForwardAmount = Duration(seconds: 5);

      if (position + fastForwardAmount >= duration) {
        _controller.seekTo(duration);
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.seekTo(position + fastForwardAmount);
      }
    });
  }

  void _rewind() {
    setState(() {
      final Duration position = _controller.value.position;
      const Duration rewindAmount = Duration(seconds: 5);

      if (position - rewindAmount <= Duration.zero) {
        _controller.seekTo(Duration.zero);
      } else {
        _controller.seekTo(position - rewindAmount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _rewind,
                      icon: const Icon(
                        Icons.replay_5,
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.pumpkin,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: _togglePlayPause,
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: AppColors.white,
                          ),
                        )),
                    IconButton(
                      onPressed: _fastForward,
                      icon: const Icon(
                        Icons.forward_5,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.white,
                    bufferedColor: Colors.grey.shade300,
                    playedColor: Colors.red,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
