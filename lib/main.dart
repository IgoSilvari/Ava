import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/database/database.dart';
import 'package:teste_ava/provider.dart';
import 'package:teste_ava/router.dart';
import 'package:teste_ava/themes.dart';
import 'package:teste_ava/ui/splash_screen/splash_screen.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized(); 
  await getDatabase();
  runApp(const TesteAva());
}

class TesteAva extends StatefulWidget {
  const TesteAva({super.key});

  @override
  State<TesteAva> createState() => _TesteAvaState();
}

class _TesteAvaState extends State<TesteAva> {
  @override
  void initState() {
    systemDefaut();
    super.initState();
  }

  void systemDefaut() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );     
  }

  final root = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: listProviders(),
      child: MaterialApp(
        title: 'Teste AVA',
        debugShowCheckedModeBanner: false,
        theme: AvaThemes.appTheme(context: context),
        home: const SplashScreen(),
        onGenerateRoute: root.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
