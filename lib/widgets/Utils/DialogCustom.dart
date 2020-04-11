import 'package:flutter/material.dart';
import 'package:self_widget/Theme/Helpers/sbHelper.dart';
import 'package:self_widget/widgets/Animated/curves_delay_animation.dart';

showDialogBox(
    {@required BuildContext context,
    // @required String heading,
    // @required String subheading,
    Color bgColor,
    @required Widget content,
    Curve curve = Curves.bounceOut,
    VoidCallback onOktap,
    VoidCallback onNotOk}) {
  showDialog(
      context: context,
      builder: (context) {
        bgColor ??= Color.fromARGB(255, 34, 51, 85);

        List<Widget> widgets = [];
        if (onNotOk != null) {
          widgets.add(
            SafeArea(
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red[400],
                  size: sz(36),
                ),
                onPressed: () {
                  onNotOk();
                  Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        }

        if (onOktap != null) {
          widgets.add(
            SafeArea(
              child: IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: sz(36),
                ),
                onPressed: () {
                  onOktap();
                  Navigator.pop(context);
                },
              ),
            ),
          );
        }

        final Widget child = SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
              child: Material(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    content,
                    // sb(25),
                    // Text(
                    //   heading,
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.body2
                    //       .copyWith(color: Colors.red[500]),
                    // ),
                    // sb(25),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: sz(20)),
                    //   child: Text(
                    //     subheading,
                    //     textAlign: TextAlign.center,
                    //     style: Theme.of(context).textTheme.body2
                    //         .copyWith(color: Colors.white),
                    //   ),
                    // ),
                    // sb(30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widgets
                        // children: <Widget>[
                        //   // onOktap !=null ? :,
                        //   SafeArea(
                        //     child: IconButton(
                        //       icon: Icon(
                        //         Icons.close,
                        //         color: Colors.red[400],
                        //         size: sz(36),
                        //       ),
                        //       onPressed: onNotOk,
                        //     ),
                        //   ),
                        //   SafeArea(
                        //     child: IconButton(
                        //       icon: Icon(
                        //         Icons.check,
                        //         color: Colors.white70,
                        //         size: sz(36),
                        //       ),
                        //       onPressed: onOktap,
                        //     ),
                        //   )
                        // ],
                        ),
                    sb(sz(10)),
                  ],
                ),
              ),
            ),
          ),
        );

        return CurveDelayedAnimation(0,
            curve: curve,
            extent: 100,
            vertical: true,
            horizontal: false,
            child: child);
      });
}

/* 
 final wid = GestureDetector(
       onTap: () {
         showDialogBox(
           context: context,
           heading: "Are You Sure",
           subheading: "Are You Certain You wanna close me hm hm hm",
           onNotOk: () {},
           onOktap: () {},
         );
       },
       child: Center(
         child: FittedBox(
           child: Container(
             height: 300,
             width: 300,
             decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.8),
                 borderRadius: BorderRadius.circular(20)),
           ),
         ),
       ),
     );
     
*/
