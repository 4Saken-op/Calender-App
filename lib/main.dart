import 'package:calendar_app/widgets/calendar_widget.dart';
import 'package:calendar_app/widgets/event_editing_page.dart';
import 'package:calendar_app/widgets/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calendar App',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black, primaryColor: Colors.green),
        home: MainPage(),
      ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Calendar Events App"),
          centerTitle: true,
        ),
        body: const CalendarWidget(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.red,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EventEditingPage()))),
      ),
    );
  }
}
