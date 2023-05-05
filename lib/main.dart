import 'dart:html';
import 'package:flutter/material.dart';
import 'package:stopwatch/plan_provider.dart';
import 'package:stopwatch/views/plan_creator_screen.dart';
import 'package:stopwatch/views/plan_screen.dart';


void main() => runApp(MasterPlanApp());
class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: PlanCreatorScreen(),
      ),
    );
  }
}
