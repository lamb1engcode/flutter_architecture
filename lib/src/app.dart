import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/src/providers/user_provider.dart';
import 'package:flutter_architecture/src/screens/authentication/login_screen.dart';
import 'package:flutter_architecture/src/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    // Lock orientation device is vertical, if you don't want it, let comment below 3 lines.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<UserProvider>().user == null
        ? LoginScreen()
        : HomeScreen();
  }
}
