import 'package:flutter/widgets.dart';
import 'package:self_widget/FunctionDart/high_order_function.dart';
import 'package:self_widget/Theme/Helpers/layout_helper.dart';
import 'package:self_widget/http/Failures.dart';

class Sizer {
  static double Function() getScreenWidth, getScreenHeight;
  static instantiate(DeviceScreenType dt, double w, double h) {
    double sw, sh;

    switch (dt) {
      case DeviceScreenType.Mobile:
        sw = 1;
        sh = 1;
        break;
      case DeviceScreenType.Tablet:
        sw = 2;
        sh = 1.4;
        break;
      case DeviceScreenType.Desktop:
        sw = 3.4;
        sh = 2.4;
        break;
      default:
        throw Failure("UnKnown Device");
    }
    fach = giver(sh); // singleInvocation(sh, (double i) => i);
    facw = giver(sw); //singleInvocation(sw, (double i) => i);
    getScreenWidth = giver(w);
    getScreenHeight = giver(h);
  }
}

double Function() fach, facw;

// Add commonly uses 0 sized box for optimzation
Map<double, SizedBox> boxh = {0: const SizedBox()},
    boxw = {0: const SizedBox()};

SizedBox sbh(double h) => _getSbfromMap(boxh, h * fach(), true);
SizedBox sbw(double w) => _getSbfromMap(boxw, w * facw(), false);

SizedBox _getSbfromMap(Map<double, SizedBox> m, double k, bool ish) {
  if (m.containsKey(k)) {
    return m[k];
  } else {
    m[k] = ish ? SizedBox(height: k) : SizedBox(width: k);
    return m[k];
  }
}

double szh(double h) => h * fach();
double szw(double w) => w * facw();

Duration dr(int duration) => Duration(milliseconds: duration);

Future fdr(int duration) => Future.delayed(dr(duration));

SizedBox sb(double h) => sbh(h);

double sz(double h) => szh(h);
