import 'package:dartz/dartz.dart';

import 'package:self_widget/http/Failures.dart';

import 'failure_helper.dart';

Either<Failure, E> handleMapParseError<E>(E Function() f) {
  try {
    final r = f();
    return right(r);
  } on NoSuchMethodError catch (e) {
    return left(Failure(
      'We have experences some inconsistencies with the server.We will fix it soon.Sorry for the inconvenience',
      'Server Failure : $e',
    ));
  } catch (e) {
    return left(getUnExpectedFailure(e));
  }
}
