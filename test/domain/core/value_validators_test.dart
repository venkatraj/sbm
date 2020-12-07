import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sbm/domain/core/value_failures.dart';
import 'package:sbm/domain/core/value_validators.dart';

void main() {
  group('Email Validator tests', () {
    test('should get valid email string', () {
      const input = 'raj@venkat.me';
      final result = validateEmail(input);

      expect(result, right(input));
    });

    test('should get value failure', () {
      const input = 'some string';
      final result = validateEmail(input);

      expect(
        result,
        left(const ValueFailure<String>.invalidEmail(failedValue: input)),
      );
    });
  });

  group('Password validator tests', () {
    test('should get a valid password string', () {
      const input = 'abc123';
      final result = validatePassword(input);

      expect(result, right(input));
    });

    test('should get a short password value failure object', () {
      const input = '123';
      final result = validatePassword(input);

      expect(
        result,
        left(const ValueFailure<String>.shortPassword(failedValue: input)),
      );
    });
  });
}
