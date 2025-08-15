import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/controllers/bookmark_controller.dart';
import 'package:movies/views/screens/Home_screen.dart';
import 'package:movies/views/screens/wrapper_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkController(),
      child: MaterialApp(
        home: WrapperScreen(),
      ),
    );
  }
}