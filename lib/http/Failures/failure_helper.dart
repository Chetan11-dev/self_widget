import '../Failures.dart';

String formatError(e) =>
    (e == null ? "." : "  ${e.toString()}."); //" " + e.toString() + ".");

Failure getUnExpectedFailure(e) =>
    Failure("Sorry an unexpected error occurerd${formatError(e)}");

Failure getUnknownFailure(e) => Failure("A failure occured${formatError(e)}");
