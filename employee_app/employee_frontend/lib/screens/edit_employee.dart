import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';

class EditEmployeeScreen extends StatefulWidget {
  final Employee employee;

  EditEmployeeScreen({required this.employee});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController roleController;
  late TextEditingController departmentController;
  late TextEditingController salaryController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.employee.name);
    emailController = TextEditingController(text: widget.employee.email);
    roleController = TextEditingController(text: widget.employee.role);
    departmentController =
        TextEditingController(text: widget.employee.department);
    salaryController =
        TextEditingController(text: widget.employee.salary);
  }

  void handleUpdate() {
    Employee updatedEmployee = Employee(
      id: widget.employee.id,
      name: nameController.text,
      email: emailController.text,
      role: roleController.text,
      department: departmentController.text,
      salary: salaryController.text,
    );

    EmployeeService.updateEmployee(updatedEmployee);
    Navigator.pop(context);
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField('Name', nameController),
            buildTextField('Email', emailController),
            buildTextField('Role', roleController),
            buildTextField('Department', departmentController),
            buildTextField('Salary', salaryController),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: handleUpdate,
                child: Text('Update Employee'),
              ),
            )
          ],
        ),
      ),
    );
  }
}