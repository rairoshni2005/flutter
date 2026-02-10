class Employee {
  String? id;
  String name;
  String email;
  String role;
  String department;
  String salary;

  Employee({
    this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.department,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['_id'], // IMPORTANT
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      department: json['department'] ?? '',
      salary: json['salary'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "role": role,
      "department": department,
      "salary": salary,
    };
  }
}
