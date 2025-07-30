import 'package:flutter/material.dart';
import '../constant/colors.dart';
import 'todo_list_view.dart';
import 'add_task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeView> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    TodoListScreen(),
    AddTaskScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CColor.bgColor,
        currentIndex: _selectedIndex,
        selectedItemColor: CColor.primaryColor,
        unselectedItemColor: Colors.white70,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
      ),
    );
  }
}
