import 'package:epg_viewer/api_services/api_services.dart';
import 'package:epg_viewer/screens/program_screen/utils/program_utils.dart';
import 'package:epg_viewer/services/notification_services.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:epg_viewer/utils/shared_prefs_manager.dart';
import 'package:epg_viewer/utils/utils.dart';

var locator = GetIt.instance;
Dio dio = Dio();

void setupLocator() {
  locator.registerLazySingleton<SizeConfig>(() => SizeConfig());
  locator.registerLazySingleton<Utils>(() => Utils());
  locator.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));
  locator.registerLazySingleton<SharedPrefManager>(() => SharedPrefManager());
  locator.registerLazySingleton<NotificationServices>(
      () => NotificationServices());
  locator.registerLazySingleton<ProgramUtils>(() => ProgramUtils());
}
