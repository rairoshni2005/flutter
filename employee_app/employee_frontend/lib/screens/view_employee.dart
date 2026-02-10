import 'package:flutter/material.dart';
import '../models/employee.dart';

class ViewEmployeeScreen extends StatelessWidget {
  final Employee employee;

  ViewEmployeeScreen({required this.employee});

  Widget infoTile(String title, String value) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee Details')),
      body: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            infoTile('Name', employee.name),
            infoTile('Email', employee.email),
            infoTile('Role', employee.role),
            infoTile('Department', employee.department),
            infoTile('Salary', employee.salary),
          ],
        ),
      ),
    );
  }
}