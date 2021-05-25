import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv8_universities_app/injection_container.dart' as di;
import 'package:rma_lv8_universities_app/ui/universities_list_screen.dart';

void main() {
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Universities App',
      home: UniversitiesListScreen(),
    );
  }
}
