import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

import 'package:self_widget/http/Failures.dart';
import 'package:self_widget/http/Failures/parse_failure.dart';

Future<Either<Failure, A>> getSafeResponse<A, B>(
    A Function(B) f, String url) async {
  final res = await getDecodedResponse(url);

  return res.fold<Either<Failure, A>>((failure) => left(failure),
      (success) => handleMapParseError(() => f(success)));
}

Future<Either<Failure, E>> getDecodedResponse<E>(String url) async {
  var responseJson;

  try {
    final r = await http.get(url);

    responseJson = getFailureOrResponse(r);
  } catch (e) {
    if (e is SocketException) {
      return left(Failure(
          "Sorry could not establish connection. Are you connected to Internet ?"));
      // if (e.message.contains('Failed host lookup') ||
      //     e.message.contains('Network is unreachable')) {
      //   return left(Failure(
      //       "Sorry could not establish connection. Are you connected to Internet ?"));
      // } else {
      //   return left(Failure("A failure Occured ${e.message}"));
      // }
    } else
      return left(Failure("A failure Occured $e"));
  }

  if (responseJson is Failure)
    return left(responseJson);
  else
    return right(responseJson as E);
}

dynamic getFailureOrResponse(http.Response response) {
  if (isSuccess(response)) {
    var responseJson = json.decode(response.body.toString());
    return responseJson;
  }
  switch (response.statusCode) {
    case 400:
      return BadRequestFailure(response.body.toString());
    case 401:
    case 403:
      return UnauthorisedFailure(response.body.toString());

    case 500:
    default:
      return FetchDataFailure(
          'Error occured while Communication with our Server Error StatusCode : ${response.statusCode}');
  }
}

bool isSuccess(http.Response response) =>
    response.statusCode >= 200 && response.statusCode <= 300;
