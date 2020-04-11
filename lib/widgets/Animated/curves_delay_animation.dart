import 'dart:async';

import 'package:flutter/material.dart';

class CurveDelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final bool vertical;
  final bool horizontal;
  final int extent;
  final Curve curve;

  CurveDelayedAnimation(this.delay,
      {@required this.child,
      this.curve = Curves.bounceOut,
      this.vertical = false,
      this.extent = 50,
      this.horizontal = true});

  @override
  _CurveDelayedAnimationState createState() => _CurveDelayedAnimationState();
}

class _CurveDelayedAnimationState extends State<CurveDelayedAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  int extent;

  @override
  void initState() {
    super.initState();
    extent = widget.extent;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    Future.delayed(Duration(milliseconds: widget.delay)).then((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.vertical && widget.horizontal) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform(
              transform: Matrix4.translationValues(
                  (1 - _animation.value) * extent,
                  (1 - _animation.value) * extent,
                  0),
              child: child,
            ),
          );
        },
        child: widget.child,
      );
    } else if (widget.horizontal) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform(
              transform: Matrix4.translationValues(
                  (1 - _animation.value) * extent, 0, 0),
              child: child,
            ),
          );
        },
        child: widget.child,
      );
    } else {
      //
      return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform(
              transform: Matrix4.translationValues(
                  0, (1 - _animation.value) * extent, 0),
              child: child,
            ),
          );
        },
        child: widget.child,
      );
    }
  }
}
