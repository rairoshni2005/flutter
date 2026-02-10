import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  EmployeeListScreenState createState() => EmployeeListScreenState();
}

class EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> employees = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

 Future<void> fetchEmployees() async {
  try {
    final data = await EmployeeService.getAllEmployees();

    print("Fetched Employees: ${data.length}");
    print("First Employee: ${data.isNotEmpty ? data[0].name : 'No data'}");

    setState(() {
      employees = data;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    print("Error fetching employees: $e");
  }
}


  Future<void> handleDelete(String? id) async {
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Employee ID"))
      );
      return;
    }
    await EmployeeService.deleteEmployee(id);
    fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Employees'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : employees.isEmpty
              ? Center(
                  child: Text(
                    'No employees added yet',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    Employee employee = employees[index];

                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.indigo,
                              child: Text(
                                employee.name.isEmpty
                                    ? "A"
                                    : employee.name[0].toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(employee.email,
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 4),
                                  Text(employee.role,
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => handleDelete(employee.id),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_employee');
          fetchEmployees();  // <-- IMPORTANT
        },
      ),
    );
  }
}
