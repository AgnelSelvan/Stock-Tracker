import 'package:dartz/dartz.dart';
import 'package:stock_tracker/modules/auth/domain/entities/user.dart';
import 'package:stock_tracker/utility/failure/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser?>> login(String email, String password);
}
