import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp_admin_app/bottom_bar_view.dart';
import 'package:fyp_admin_app/providers/user_provider.dart';
import 'package:fyp_admin_app/ui_view/login_view.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';
import 'package:fyp_admin_app/utils/themeModeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences.getInstance().then((prefs) {
    var themeMode = prefs.getInt('themeMode') ?? 0;

    runApp(
      ChangeNotifierProvider<ThemeModeNotifier>(
        create: (_) =>
            ThemeModeNotifier(ThemeMode.values[themeMode]),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeModeNotifier>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeNotifier.getThemeMode(),
        title: "Tour Guide App",
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const BottomBarView(selectedIndex: 0,);

              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Login();
          },
        ),
      ),
    );
  }
}