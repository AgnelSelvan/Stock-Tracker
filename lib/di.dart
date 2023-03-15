import 'package:get_it/get_it.dart';
import 'package:stock_tracker/modules/auth/data/datasources/remote_data_source.dart';
import 'package:stock_tracker/modules/auth/data/repositories/auth_impl.dart';
import 'package:stock_tracker/modules/auth/domain/repositories/auth_repository.dart';
import 'package:stock_tracker/modules/auth/domain/usecases/login.dart';
import 'package:stock_tracker/modules/auth/presentation/state/bloc/auth_bloc.dart';

final localtor = GetIt.instance;

void setUp() {
  //Bloc
  localtor.registerFactory(() => AuthBloc(localtor()));

  //Usecase
  localtor.registerLazySingleton(() => Login(localtor()));

  // Repository
  localtor.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localtor()),
  );

  // Data source
  localtor.registerLazySingleton<AuthRDS>(() => AuthRDSImpl());
}
