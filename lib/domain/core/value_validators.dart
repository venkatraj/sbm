import 'package:dartz/dartz.dart';
import 'package:sbm/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

validatePassword(String input) {
  if (input.length >= 6) {
    return left(input);
  } else {
    return right(ValueFailure.shortPassword(failedValue: input));
  }
}