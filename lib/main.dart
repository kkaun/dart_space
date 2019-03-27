import 'package:dart_space/injection_container.dart';
import 'package:dart_space/ui/daily_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  initKiwi();
  runApp(DartSpaceApp());  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black87,
    statusBarColor: Colors.black87,
  ));
}

class DartSpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA APOD',
      theme: ThemeData(
        canvasColor: Colors.primaries[6],
      ),
      home: DailyInfoPages(),
      debugShowCheckedModeBanner: false,
    );
  }
}