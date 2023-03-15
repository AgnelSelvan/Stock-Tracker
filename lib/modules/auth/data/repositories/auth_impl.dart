import 'package:dartz/dartz.dart';
import 'package:stock_tracker/modules/auth/data/datasources/remote_data_source.dart';
import 'package:stock_tracker/modules/auth/domain/entities/user.dart';
import 'package:stock_tracker/modules/auth/domain/repositories/auth_repository.dart';
import 'package:stock_tracker/utility/failure/failure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRDS authRDS;

  AuthRepositoryImpl(this.authRDS);

  @override
  Future<Either<Failure, AppUser?>> login(String email, String password) async {
    try {
      final result = await authRDS.login(email, password);
      return Right(result?.toUser);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
