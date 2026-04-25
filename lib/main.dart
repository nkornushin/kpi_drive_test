import 'package:flutter/material.dart';
import 'package:kpi_drive_test/core/di/dependency_injection.dart';
import 'package:kpi_drive_test/core/utils/custom_scroll_behavior.dart';
import 'package:kpi_drive_test/features/tasks/presentation/pages/kanban_page.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'KPI Drive Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const KanbanPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
