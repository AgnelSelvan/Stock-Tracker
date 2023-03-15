import 'package:dartz/dartz.dart';
import 'package:stock_tracker/modules/auth/domain/entities/user.dart';
import 'package:stock_tracker/modules/auth/domain/repositories/auth_repository.dart';
import 'package:stock_tracker/utility/failure/failure.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, AppUser?>> execute(String email, String password) {
    return repository.login(email, password);
  }
}
