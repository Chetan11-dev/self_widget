import 'package:flutter/material.dart';
import 'package:self_widget/Theme/Helpers/sbHelper.dart';
import 'package:self_widget/Theme/ThemeManager.dart';
import 'package:self_widget/http/Failures/failure_helper.dart';

// It does not support nulls as return value of future
FutureBuilder<T> smartFutureBuilder<T>(
    {@required Future<T> f,
    @required Widget Function(T t) s,
    Widget Function(dynamic) e,
    Widget Function() w,
    T initialData}) {
  return FutureBuilder<T>(
    future: f,
    initialData: initialData,
    builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
      if (snapshot.hasData && !snapshot.hasError) {
        print('Having data state ');
        // snapshot.connectionState ==
        return s(snapshot.data);
      }

      if (snapshot.hasError) {
        e ??= (e) => Text(
              getUnknownFailure(snapshot.error).toString(),
              style: Theme.of(context).textTheme.headline.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: szh(27)),
            );
        return e(snapshot.error);
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        w ??= () => Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(getThemeData().primaryColor),
            ));
        return w();
      }
      // you dont have data , no error , completed yet calling again stupid !!!
      if (snapshot.data == null) {
        throw 'you dont have data , no error , completed yet giving null stupid !!';
      }

      throw "unknown state ${snapshot.connectionState}  + ${snapshot.error} +${snapshot.data} ";
    },
  );
}

// FutureBuilder<T> smartFutureBuilder<T>(
//     {@required Future<T> f,
//     @required Widget Function(T t) s,
//     Widget Function(dynamic) e,
//     Widget Function() w,
//     T initialData}) {
//   return FutureBuilder<T>(
//     future: f,
//     initialData: initialData,
//     builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         w ??= () => Center(
//                 child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(getThemeData().primaryColor),
//             ));
//         return w();
//       } else if (snapshot.hasError) {
//         e ??= (e) => Text(
//               getUnknownFailure(snapshot.error).toString(),
//               style: Theme.of(context).textTheme.headline.copyWith(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontSize: szh(27)),
//             );
//         return e(snapshot.error);
//       } else if (snapshot.connectionState == ConnectionState.done)
//         return s(snapshot.data);
//       else
//         throw "unknown state ${snapshot.connectionState}  + ${snapshot.error} +${snapshot.data} ";
//     },
//   );
// }
