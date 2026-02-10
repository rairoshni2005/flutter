import 'package:employee_crud_app/models/employee.dart';
import 'package:employee_crud_app/services/employee_service.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  @override
  AddEmployeeScreenState createState() => AddEmployeeScreenState();
}

class AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final departmentController = TextEditingController();
  final salaryController = TextEditingController();

  void handleSubmit() async {
 Employee e = Employee(
  name: nameController.text,
  email: emailController.text,
  role: roleController.text,
  department: departmentController.text,
  salary: salaryController.text,
);


  try {
    await EmployeeService.addEmployee(e);
    Navigator.pop(context);   // only after success
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to add employee"))
    );
  }
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
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                      onPressed: handleSubmit,
                      child: Text(
                        'Add Employee',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
