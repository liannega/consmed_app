import 'package:consmed_app/config/router/approuter.dart';
import 'package:consmed_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF0097A7),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    const ProviderScope(child: ConsmedApp()),
  );
}

class ConsmedApp extends StatelessWidget {
  const ConsmedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: approuter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
