import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // Services
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton<SizeHelperService>(SizeHelperService());
}
