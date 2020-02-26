
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/core/viewmodels/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setuplocator(){
  locator.registerLazySingleton(()=>AuthenticationService());
  locator.registerLazySingleton(()=> NavigationService());

  locator.registerFactory(()=>LoginViewmodel());
}