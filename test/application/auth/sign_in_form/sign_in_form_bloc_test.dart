import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:sbm/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:sbm/domain/auth/i_auth_facade.dart';
import 'package:sbm/domain/auth/value_objects.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockIAuthFacade extends Mock implements IAuthFacade {}

void main() {
  group('SignInFormBloc', () {
    SignInFormBloc signInFormBloc;
    MockIAuthFacade mockIAuthFacade;
    const tEmailStr = 'raj@venkat.me';
    const tPasswordStr = '123456';

    setUp(() {
      mockIAuthFacade = MockIAuthFacade();
      signInFormBloc = SignInFormBloc(mockIAuthFacade);
    });

    blocTest(
      'email changed event',
      build: () => signInFormBloc,
      act: (bloc) => bloc.add(const SignInFormEvent.emailChanged(tEmailStr)),
      expect: [
        SignInFormState(
          emailAddress: EmailAddress(tEmailStr),
          password: Password(''),
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'password changed event',
      build: () => signInFormBloc,
      act: (bloc) =>
          bloc.add(const SignInFormEvent.passwordChanged(tPasswordStr)),
      expect: [
        SignInFormState(
          emailAddress: EmailAddress(''),
          password: Password(tPasswordStr),
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    // blocTest(
    //   'register with email and password pressed event',
    //   build: () {
    //     when(signInFormBloc.state).thenReturn(
    //       SignInFormState(
    //         emailAddress: EmailAddress(tEmailStr),
    //         password: Password(tPasswordStr),
    //         isSubmitting: false,
    //         showErrorMessages: false,
    //         authFailureOrSuccessOption: none(),
    //       ),
    //     );
    //     when(
    //       mockIAuthFacade.registerWithEmailAndPassword(
    //         emailAddress: EmailAddress(tEmailStr),
    //         password: Password(tPasswordStr),
    //       ),
    //     ).thenAnswer(
    //       (_) async => right(unit),
    //     );
    //     return signInFormBloc;
    //   },
    //   act: (bloc) =>
    //       bloc.add(const SignInFormEvent.registerWithEmailAndPasswordPressed()),
    //   expect: [
    //     SignInFormState(
    //       emailAddress: EmailAddress(tEmailStr),
    //       password: Password(tPasswordStr),
    //       isSubmitting: true,
    //       showErrorMessages: false,
    //       authFailureOrSuccessOption: none(),
    //     ),
    //     SignInFormState(
    //       emailAddress: EmailAddress(tEmailStr),
    //       password: Password(tPasswordStr),
    //       isSubmitting: false,
    //       showErrorMessages: true,
    //       authFailureOrSuccessOption: optionOf(right(unit)),
    //     ),
    //   ],
    // );
  });
}
