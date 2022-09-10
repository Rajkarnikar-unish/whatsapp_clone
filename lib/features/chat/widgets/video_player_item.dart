import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    Key? key,
    required this.videoURL,
  }) : super(key: key);

  final String videoURL;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late CachedVideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        CachedVideoPlayerController.network(widget.videoURL)
          ..initialize().then((value) {
            _videoPlayerController.setVolume(1);
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          CachedVideoPlayer(
            _videoPlayerController,
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                isPlay ? Icons.pause_circle : Icons.play_circle,
                size: 30,
              ),
              onPressed: () {
                if (isPlay) {
                  _videoPlayerController.pause();
                } else {
                  _videoPlayerController.play();
                }

                setState(() {
                  isPlay = !isPlay;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
