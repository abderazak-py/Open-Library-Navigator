import 'package:open_library_navigator/core/utils/api_service.dart';
import 'package:open_library_navigator/features/home/data/repos/home_repo_impl.dart';
import 'package:open_library_navigator/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(ApiService(Dio())));
}
