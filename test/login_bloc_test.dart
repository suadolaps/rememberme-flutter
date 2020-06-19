import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remember_me/blocs/authentication/authentication.dart';
import 'package:remember_me/blocs/login/login.dart';
import 'package:remember_me/repositories/models/models.dart';
import 'package:remember_me/repositories/repositories.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository{}

void main() {
  group('LoginBloc', (){
    LoginBloc loginBloc;
    MockUserRepository userRepository;

    setUp((){
      userRepository = MockUserRepository();
      loginBloc = LoginBloc(
        userRepository: userRepository,
        authenticationBloc: AuthenticationBloc(
          userRepository: userRepository,
        ),
      );
    });

    tearDown((){
      loginBloc?.close();
    });

    test('should assert if null', (){
      expect(
            () => LoginBloc(userRepository: null,
            authenticationBloc: null),
        throwsA(isAssertionError),
      );
    });


    group('LoginButtonPressed', (){
      blocTest('emits [LoginInitial, LoginInProgress] when LoginButtonPressed is added and authenticate succeeds',
        build: () async {
          when(userRepository.authenticate(email: 'test@mail.com', password: 'password234')).thenAnswer(
              (_) => Future.value(
                User(
                  id: 0,
                  email: 'test@mail.com',
                  token: '67f7ib889yn7y7og77887g8ogoo'
                ),
              ),
          );
          return loginBloc;
        },
        act: (bloc) => bloc.add(LoginButtonPressed(email: 'test@mail.com', password: 'password234')),
        expect: [
          LoginInProgress(),
          LoginInitial(),
        ],
      );

      blocTest('emits [LoginInProgress, LoginFailure] when LoginButtonPressed is added and authenticate fails',
        build: () async {
          when(userRepository.authenticate(email: 'test@mail.com', password: 'password234')).thenThrow('oops');
          return loginBloc;
        },
        act: (bloc) => bloc.add(LoginButtonPressed(email: 'test@mail.com', password: 'password234')),
        expect: [
          LoginInProgress(),
          LoginFailure(
            error: 'oops'
          ),
        ],
      );

    });

  });



}


