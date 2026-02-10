import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';

class EmployeeService {

  static const String API_URL = 'http://192.168.1.240:4000/employees';

  static Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  static Future<void> addEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse(API_URL),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Failed to add employee');
    }
  }

  static Future<void> deleteEmployee(String id) async {
    final response = await http.delete(Uri.parse('$API_URL/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}
