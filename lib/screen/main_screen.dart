import 'package:flutter/material.dart';
import 'package:lets_app/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Profile')),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text(
          'Lets.com',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite_outline),
            ),
            BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(Icons.person_outline),
            ),
          ]),
    );
  }
}
