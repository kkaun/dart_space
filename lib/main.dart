import 'package:dart_space/ui/daily_info_page.dart';
import 'package:flutter/material.dart';
import 'package:simple_coverflow/simple_coverflow.dart';


void main() => runApp(DartSpaceApp());

class DartSpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lime',
      theme: ThemeData(
        canvasColor: Colors.primaries[6],
      ),
      home: DailyInfoPage(),
    );
  }
}