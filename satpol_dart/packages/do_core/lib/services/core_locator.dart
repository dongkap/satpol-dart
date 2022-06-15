import 'package:do_core/core.dart';
import 'package:get_it/get_it.dart';

GetIt coreLocator = GetIt.instance;

Future<void> setupCoreLocator() async {
  SharedPreferencesService? sharedPreferencesService =
      await SharedPreferencesService.getInstance();
  coreLocator
      .registerSingleton<SharedPreferencesService>(sharedPreferencesService!);

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  coreLocator
      .registerSingleton<AuthenticationRepository>(authenticationRepository);
}
