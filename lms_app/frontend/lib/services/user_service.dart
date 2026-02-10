import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService{
    
    static String API_URL = "http://localhost:4000/api/auth";


    static Future<dynamic> register(User user) async {
        final response = await http.post(
            Uri.parse('$API_URL/register'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user.toJson()),
        );
        return jsonDecode(response.body);
    }

    static Future<dynamic> login(String username, String password) async {
        final response = await http.post(
            Uri.parse('$API_URL/login'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
                'username': username,
                'password': password,
            }),
        );
        return jsonDecode(response.body);
    }
}