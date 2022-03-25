import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';

class OnloadingScreen extends StatelessWidget {
  const OnloadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(22 / 7),
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: redColor.withOpacity(0.42),
                  height: size.height * 0.45,
                  width: size.width * 0.85,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(22 / 7),
              child: ClipPath(
                clipper: WaveClipperFour(),
                child: Container(
                  color: greenColor.withOpacity(0.59),
                  height: size.height * 0.28,
                  width: size.width,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(22 / 7),
              child: ClipPath(
                clipper: WaveClipperMountain(),
                child: Container(
                  color: primaryColor.withOpacity(0.72),
                  height: size.height * 0.6,
                  width: size.width * 0.7,
                ),
              ),
            ),
          ),
          Center(
            child: Logo(
              width: size.width * 0.5,
              height: size.height * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
