import 'package:ecommerce/core/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => serviceLocator.init();

/*
first add function getIT
define variable form GetIT.instance and store the object in 
- register singleton 
create for one time when you run auto the project and when i want access this object take the same 
-register lazy singleton 
when i need object will be created 
-factory singleton
this for every time call services access a new object from the type 
look like make register for object that have type AuthRemoteDataSources and his value is AuthRemoteApiDataSources
*/
