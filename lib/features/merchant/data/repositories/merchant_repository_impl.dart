import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';
import 'package:ztask/core/error/exceptions.dart';
import 'package:ztask/core/error/failure.dart';
import 'package:ztask/core/network/model/api_response.dart';
import 'package:ztask/features/merchant/domain/entities/merchant_entity.dart';
import 'package:ztask/features/merchant/data/data_sources/merchant_remote_data_source.dart';
import 'package:ztask/features/merchant/domain/repositories/merchant_repository.dart';

///[MerchantRepositoryImplement]
///[Implementation]
@Injectable(as: MerchantRepository)
class MerchantRepositoryImplement implements MerchantRepository {
  final MerchantRemoteDataSource merchantRemoteDataSource;

  const MerchantRepositoryImplement(
    this.merchantRemoteDataSource,
  );

  @override
  Future<Either<Failure, APIResponse<MerchantEntity>>> getMerchantDetails(int id) async {
    try {
      return Right(await merchantRemoteDataSource.getMerchantDetails(id));
    } on ServerException catch (ex) {
      /// This will only be used in case of crashlytics reporter
      // AppCrashReporter.recordError(
      //   ex.message,
      //   exception: ex,
      //   stack: s,
      //   className: "MerchantRepositoryImplement",
      //   functionName: "getMerchantDetails",
      // );
      return Left(ServerFailure(messages: ex.messages));
    }
  }
}
