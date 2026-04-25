import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kpi_drive_test/features/tasks/data/services/tasks_api_client.dart';
import 'package:kpi_drive_test/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:kpi_drive_test/features/tasks/data/services/tasks_api_service.dart';
import 'package:kpi_drive_test/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(
    () =>
        Dio(
            BaseOptions(
              baseUrl: 'https://api.dev.kpi-drive.ru/_api',
              headers: const {
                'Authorization': 'Bearer 5c3964b8e3ee4755f2cc0febb851e2f8',
              },
            ),
          )
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              maxWidth: 90,
            ),
          ),
  );

  getIt.registerLazySingleton<TasksApiClient>(
    () => TasksApiClient(getIt<Dio>()),
  );

  getIt.registerLazySingleton<TasksApiService>(
    () => TasksApiService(getIt<TasksApiClient>()),
  );

  getIt.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(getIt<TasksApiService>()),
  );

  getIt.registerFactory<TasksBloc>(
    () => TasksBloc(getIt<TasksRepository>()),
  );
}
