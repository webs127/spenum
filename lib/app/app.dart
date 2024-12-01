import 'package:spenum/app/index.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375,812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RandomNumberGeneratorViewmodel()),
          ChangeNotifierProvider(create: (_) => SettingsViewmodel()),
        ],
        child: const MaterialApp(
          initialRoute: RouteManager.splash,
          onGenerateRoute: Routes.getRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}