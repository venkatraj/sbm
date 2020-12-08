import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sbm/domain/auth/auth_failures.dart';
import 'package:sbm/domain/auth/value_objects.dart';
import 'package:sbm/infrastructure/auth/firebase_auth_facade.dart';

class MockFirebaseAuthFacade extends Mock implements FirebaseAuthFacade {}

void main() {
  MockFirebaseAuthFacade firebaseAuthFacade;

  final emailAddress = EmailAddress('raj@venkat.me');
  final password = Password('abc1234');

  setUp(() {
    firebaseAuthFacade = MockFirebaseAuthFacade();
  });

  group('Email and Password Registration', () {
    test('should register a user and return a unit', () async {
      when(firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      )).thenAnswer((_) async => right(unit));

      final result = await firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      expect(result, right(unit));
      verify(firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      ));
      verifyNoMoreInteractions(firebaseAuthFacade);
    });

    test('should return an email already in use auth failure', () async {
      when(firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      )).thenAnswer((_) async => left(const AuthFailure.emailAlreadyInUse()));

      final result = await firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      expect(result, left(const AuthFailure.emailAlreadyInUse()));
      verify(firebaseAuthFacade.registerWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      ));
      verifyNoMoreInteractions(firebaseAuthFacade);
    });
  });

  group('Email and Password Sign In', () {
    test('should sign in a user and return a unit', () async {
      when(firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      )).thenAnswer((_) async => right(unit));

      final result = await firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      expect(result, right(unit));
      verify(firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      ));
      verifyNoMoreInteractions(firebaseAuthFacade);
    });

    test('should return an invalid email and password combination auth failure',
        () async {
      when(firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      )).thenAnswer((_) async =>
          left(const AuthFailure.invalidEmailAndPasswordCombination()));

      final result = await firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      expect(
          result, left(const AuthFailure.invalidEmailAndPasswordCombination()));
      verify(firebaseAuthFacade.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      ));
      verifyNoMoreInteractions(firebaseAuthFacade);
    });
  });

  group('Google Sign In', () {
    test('should sign in a user and return a unit', () async {
      when(firebaseAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => right(unit));

      final result = await firebaseAuthFacade.signInWithGoogle();

      expect(result, right(unit));
      verify(firebaseAuthFacade.signInWithGoogle());
      verifyNoMoreInteractions(firebaseAuthFacade);
    });

    test('should return a cancelled by user auth failure', () async {
      when(firebaseAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => left(const AuthFailure.cancelledByUser()));

      final result = await firebaseAuthFacade.signInWithGoogle();

      expect(result, left(const AuthFailure.cancelledByUser()));
      verify(firebaseAuthFacade.signInWithGoogle());
      verifyNoMoreInteractions(firebaseAuthFacade);
    });
  });
}
