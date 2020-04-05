import 'package:flutter/material.dart';

FutureBuilder smartFutureBuilder<T>(
    {@required Future<T> f,
    @required Widget Function(T) s,
    Widget Function(dynamic) e,
    Widget Function() w,
    T initialData}) {
  return FutureBuilder<T>(
    future: f,
    initialData: initialData,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      print(snapshot.connectionState);
      return Container();
      if (snapshot.connectionState == ConnectionState.waiting) {
        // w??="" ;
        return Container();
        return w();
      } else if (snapshot.hasError) {
        // e??= ;
        return Container();
        return e(snapshot.data);
      } else if (snapshot.connectionState == ConnectionState.done)
        return s(snapshot.data);
      else
        throw "unknown state ${snapshot.connectionState}  + ${snapshot.error} +${snapshot.data} ";
    },
  );
}
