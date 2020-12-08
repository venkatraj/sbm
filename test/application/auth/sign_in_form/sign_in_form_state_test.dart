import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sbm/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:sbm/domain/auth/value_objects.dart';

void main() {
  group('SignInFormState', () {
    test('initial state', () {
      expect(
          SignInFormState.initial(),
          SignInFormState(
            emailAddress: EmailAddress(''),
            password: Password(''),
            isSubmitting: false,
            showErrorMessages: false,
            authFailureOrSuccessOption: none(),
          ));
    });
  });
}
