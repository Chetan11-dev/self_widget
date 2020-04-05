import 'package:flutter/widgets.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;
  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}

enum DeviceScreenType { Mobile, Tablet, Desktop }

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveWidget({Key key, @required this.builder}) : super(key: key);

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing) {
      return builder(
          context,
          SizingInformation(
            orientation: mediaQuery.orientation,
            deviceType: getDeviceType(mediaQuery),
            screenSize: mediaQuery.size,
            localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
          ));
    });
  }
}

getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = getWidth(mediaQuery);

  if (deviceWidth >= 950)
    return DeviceScreenType.Desktop;
  else if (deviceWidth >= 600)
    return DeviceScreenType.Tablet;
  else
    return DeviceScreenType.Mobile;
}

getWidth(MediaQueryData q) => q.size.width;
getHeight(MediaQueryData q) => q.size.height;
