import 'dart:async';

import 'package:forms_bloc/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  // controllers
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();

  // getter add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passController.sink.add;

  // getter fetch data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPass = _passController.value;
    print('mail is $validEmail');
    print('Pass is $validPass');
  }

  // Dispose the stream when not in use
  dispose() {
    _emailController.close();
    _passController.close();
  }
}

final bloc = Bloc();
