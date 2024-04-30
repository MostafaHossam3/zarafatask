import 'package:eitherx/eitherx.dart';
import 'package:ztask/core/error/failure.dart';

abstract class BaseUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class BaseUseCasesNoParam<T> {
  Future<Either<Failure, T>> call();
}
