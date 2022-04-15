import 'package:flutter/material.dart';
import 'package:myweatherlog/screens/HomeScreen.dart';
import 'package:myweatherlog/screens/LogScreen.dart';
import 'package:myweatherlog/screens/WeatherScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather Log',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromRGBO(35, 57, 93, 1),
          secondary: Colors.blue
        )
      ),
      themeMode: ThemeMode.dark,
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = [
    HomeScreen(), /* Index 0 */
    WeatherScreen(),  /* Index 1 */
    LogScreen(),  /* Index 2 */
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Weather Log'),
        ),
        body: Container(
            child: _screens.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "WeerLive"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Log")],
          currentIndex: _selectedIndex,
          onTap:  _onItemTapped,
        ),
    );
  }
}



