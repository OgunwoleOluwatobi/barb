import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:barb/core/data_source/user_local_data_source.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:barb/core/services/http/http_service.dart';
import 'package:barb/core/services/http/http_service_impl.dart';
import 'package:barb/core/services/utility_storage_service/utility_storage_service.dart';
import 'package:barb/core/utils/exports.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  Directory appDocDir = test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  String publicKey = env['PAYSTACK_KEY']!;

  if(!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }
  
  locator.registerLazySingleton<PaystackPlugin>(
    () => PaystackPlugin()..initialize(publicKey: publicKey)
  );

  locator.registerLazySingleton<NavigationService>(
    () => NavigationService()
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl()
  );
  locator.registerLazySingleton<StorageService>(
    () => StorageService()
  );

  await StorageService().init();
  // await UserLocalDataSourceImpl().init();
}