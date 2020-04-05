import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:self_widget/Theme/Helpers/layout_helper.dart';
import 'package:self_widget/Theme/Helpers/sbHelper.dart';

main() {
  double tabw, tabh, tdim;

  setUpAll(() {
    Sizer.instantiate(DeviceScreenType.Tablet,null,null);
    tabw = 2;
    tabh = 1.4;
    tdim = 10; //test dimension
  });

  test('test  factor is Correct', () {
    expect(fach(), equals(tabh));
    expect(facw(), equals(tabw));
  });
  test('test sizing', () {
    expect(szh(tdim), equals(tdim * tabh));
    expect(szw(tdim), equals(tdim * tabw));
  });

  test('test szb', () {
    SizedBox h = sbh(tdim);
    SizedBox w = sbw(tdim);

    expect(h.height, equals(tdim * tabh));
    expect(w.width, equals(tdim * tabw));

    expect(boxh[tdim * tabh], isNotNull);
    expect(boxh[tdim * tabh], boxh[tdim * tabh]);
    expect(boxh.length, equals(2)); // as we added a const box of 0 in beggining
  });
}
