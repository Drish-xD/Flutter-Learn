import 'dart:async';

class Validators {
  // Validates the email via StreamTransformer
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError("Enter a valid Email.");
      }
    },
  );

  // Validates the Password via StreamTransformer
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 8) {
        sink.add(data);
      } else {
        sink.addError("Password must be atleast 8 characters");
      }
    },
  );
}
