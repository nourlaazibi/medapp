import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as Vector;

import '../utils/constants.dart';
import 'wave_clipper.dart';

class CustomWaveClipperHeader extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final int duration;

  CustomWaveClipperHeader({
    Key? key,
    required this.size,
    required this.xOffset,
    required this.yOffset,
    this.duration = 2000,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomWaveClipperHeaderState();
  }
}

class _CustomWaveClipperHeaderState extends State<CustomWaveClipperHeader>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    _animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animList1.add(Offset(
            i.toDouble() + widget.xOffset,
            sin((_animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
          builder: (context, child) => ClipPath(
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kColorPrimary.withOpacity(0.5),
                    kColorPrimary,
                  ],
                ),
              ),
            ),
            clipper: WaveClipper(_animationController.value, animList1),
          ),
        ),
      ),
    );
  }
}
