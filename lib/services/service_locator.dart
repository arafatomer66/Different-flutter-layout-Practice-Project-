import 'package:get_it/get_it.dart';
import 'package:learn_flutter_basic/services/service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => APIService());
}