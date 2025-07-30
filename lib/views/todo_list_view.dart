import 'package:flutter/material.dart';
import '../constant/colors.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.bgColor,
      appBar: AppBar(
        backgroundColor: CColor.bgColor,
        title: const Text('To-Do List', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Belum ada task', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}
