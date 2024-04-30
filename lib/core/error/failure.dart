import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<String> messages;

  const Failure(this.messages);

  @override
  List<Object?> get props => [
    messages,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({required List<String> messages})
      : super(messages);
}

class CacheFailure extends Failure {
  const CacheFailure({required List<String> messages})
      : super(messages);
}

class UserFailure extends Failure {
  const UserFailure({required List<String> messages})
      : super(messages);
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({required List<String> messages})
      : super(messages);
}

class FailureException implements Exception {
  final int code;
  final List<String> messages;
  const FailureException({required this.code, required this.messages});
}
