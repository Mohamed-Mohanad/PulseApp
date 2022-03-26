import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Shared/Components/components.dart';
import '../../../Shared/Style/color.dart';
import '../../../Shared/constants.dart';

class View extends StatefulWidget {
  final BasicTreatment model;

  const View({Key? key, required this.model}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  final player = AudioCache();
  late YoutubePlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.model.url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(0),
          child: NormalButton(
            buttonColor: Colors.grey,
            icon: Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      color: redColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
