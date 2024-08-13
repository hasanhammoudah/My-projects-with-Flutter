import 'package:booklyapp/Features/home/data/datasources/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/datasources/home_remote_dara_source.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final dio = Dio();

 setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
