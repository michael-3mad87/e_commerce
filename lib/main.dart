import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/route_generator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator.get<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator.get<CartCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}
