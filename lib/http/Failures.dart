class Failure {
  final _message;
  final _prefix;

  Failure([this._message = "", this._prefix = ""]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataFailure extends Failure {
  FetchDataFailure([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestFailure extends Failure {
  BadRequestFailure([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedFailure extends Failure {
  UnauthorisedFailure([message]) : super(message, "Unauthorised: ");
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure([String message]) : super(message, "Invalid Input: ");
}
