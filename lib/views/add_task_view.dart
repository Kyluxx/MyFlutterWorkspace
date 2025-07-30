import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/button.dart';
import '../constant/colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.bgColor,
      appBar: AppBar(
        backgroundColor: CColor.bgColor,
        title: const Text('Tambah Task', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Judul Task',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CColor.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CColor.primaryColor, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CButton(
              label: 'Simpan', onTap: () => {})
          ],
        ),
      ),
    );
  }
}
