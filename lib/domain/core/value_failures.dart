import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = _InvalidEmail;

  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = _ShortPassword;
}
