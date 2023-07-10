import 'package:flutter/material.dart';
import 'package:my_app/presentation/activities.dart';
import 'package:my_app/presentation/attractions.dart';
import 'package:my_app/presentation/contact.dart';
import 'package:my_app/presentation/home.dart';

final List<String> titles = [
  'Home',
  'Attractions',
  'Activities',
  'Contact'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = const [
    HomePage(),
    AttractionsPage(),
    ActivitiesPage(),
    ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Lexend'
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(titles[_selectedPage]),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: titles[0]
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.landscape),
                label: titles[1]
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.sports),
              label: titles[2]
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.phone),
              label: titles[3]
            )
          ],
        ),
      ),
    );
  }
}
