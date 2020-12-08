import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sbm/domain/core/value_failures.dart';

import 'errors.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() =>
      value.fold((failure) => throw UnexpectedValueError(failure), id);

  bool get isValid => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
