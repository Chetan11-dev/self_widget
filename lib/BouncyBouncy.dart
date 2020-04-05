import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/material.dart';

class BouncyBouncy extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool singleTap;

  const BouncyBouncy({
    Key key,
    this.onTap,
    this.child,
    this.singleTap = false,
  }) : super(key: key);

  @override
  _BouncyBouncyState createState() => _BouncyBouncyState();
}

class _BouncyBouncyState extends State<BouncyBouncy> {
  bool scale = false;
  bool handled = false;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedWidget.tween(
      enabled: scale,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
      scaleDisabled: 1.0,
      scaleEnabled: 0.9,
      child: GestureDetector(
          onTapDown: (_) {
            setState(() => scale = !scale);
          },
          onTapUp: (_) {
            setState(() => scale = !scale);
          },
          onTap: () {
            setState(() {
              scale = !scale;
            });

            Future.delayed(const Duration(milliseconds: 200))
                .then((_) => setState(() {
                      scale = !scale;
                      Future.delayed(const Duration(milliseconds: 200))
                          .then((_) {
                        if (!handled && widget.onTap != null) widget.onTap();
                        if (widget.singleTap) handled = true;
                      });
                    }));
          },
          child: widget.child),
    );
  }
}
