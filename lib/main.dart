import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soptify/core/config/theme/app_theme.dart';
import 'package:soptify/presentation/chooseMode/bloc/theme_cubit.dart';
import 'package:soptify/presentation/splash/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soptify/service_locator.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
    ? HydratedStorageDirectory.web
    : HydratedStorageDirectory((await getTemporaryDirectory()).path) ,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initalizeDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: SplashScreenPage(),
        ),
      ),
    );
  }
}