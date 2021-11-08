import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

import 'Screens/discount_card.dart';
import 'Screens/main_screen.dart';
import 'Screens/statistics_screen.dart';
import 'Screens/stories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'circular_bottom_navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Главная", Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.amp_stories_outlined, "Советы", Colors.grey,
        labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.stacked_bar_chart, "Статистика", Colors.grey),
    TabItem(Icons.credit_card_sharp, "Карты", Colors.grey),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan = '';
    Widget selectedScreen = MainScreen();
    switch (selectedPos) {
      case 0:
        selectedScreen = MainScreen();
        break;
      case 1:
        selectedScreen = Stories_screen();
        break;
      case 2:
        selectedScreen = StatisticsScreen();
        break;
      case 3:
        selectedScreen = discount_cards_screen(context);
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: selectedScreen
        ),
      ),
      onDoubleTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 800),
      selectedCallback: (int selectedPos) {//, Widget selectedWidget) {
        setState(() {
          this.selectedPos = selectedPos;
          //this.selectedWidget = selectedWidget;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
