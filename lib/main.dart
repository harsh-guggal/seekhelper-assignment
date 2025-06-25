import 'package:flutter/material.dart';
import 'package:flutter_asignment/provider/connectivity_provider.dart';
import 'package:flutter_asignment/provider/data_provider.dart';
import 'package:flutter_asignment/screens/splash_screen.dart';
import 'package:flutter_asignment/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Harsh Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
        home: SplashScreen(),
      ),
    );
  }
}
