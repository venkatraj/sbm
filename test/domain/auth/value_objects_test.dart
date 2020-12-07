import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sbm/domain/auth/value_objects.dart';
import 'package:sbm/domain/core/value_failures.dart';

void main() {
  group('EmailAddress object tests', () {
    test('should return valid email address value', () {
      const validInput = 'raj@venkat.me';
      final result = EmailAddress(validInput);

      expect(result.value, const Right(validInput));
    });

    test('should return an invalid email value failure', () {
      const invalidInput = 'asdf';
      final result = EmailAddress(invalidInput);

      expect(
        result.value,
        left(ValueFailure<String>.invalidEmail(failedValue: invalidInput)),
      );
    });
  });

  group('Password object tests', () {
    test('should return a valid password value', () {
      const input = 'abc1234';
      final result = Password(input);

      expect(
        result.value,
        right(input),
      );
    });

    test('should return a short password value failure object', () {
      const invalidInput = '123';
      final result = Password(invalidInput);
      expect(
        result.value,
        left(ValueFailure<String>.shortPassword(failedValue: invalidInput)),
      );
    });
  });
}
