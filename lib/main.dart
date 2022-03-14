import 'package:designs/pages/animated_navbar/animated_navBar_page.dart';
import 'package:designs/pages/change_theme/change_theme_page.dart';
import 'package:designs/pages/home_page.dart';
import 'package:designs/pages/profile/profile_page.dart';
import 'package:designs/providers/config_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ConfigAppProvider())),
      ],
      builder: (context, _) {
        return MaterialApp(
          title: 'Diseños perrones',
          debugShowCheckedModeBanner: false,
          themeMode: context.watch<ConfigAppProvider>().themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          initialRoute: 'home',
          routes: {
            'home': (_) => HomePage(),
            'profile': (_) => ProfilePage(),
            'animatedNavBar': (_) => AnimatedNavBarPage(),
            'changeTheme': (_) => const ChangeThemePage(),
          },
        );
      },
    );
  }
}
