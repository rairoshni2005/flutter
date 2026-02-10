import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../utils/custom_alert_box.dart';
import 'dart:async';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

    @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen>{
    
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void handleRegister() async {
        final user = User(
            id: '',
            name: nameController.text,
            username: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
        );

    final response = await UserService.register(user);
    if(response['message'] == 'User registered successfully'){
        // CustomAlertBox.showSuccess(context, 'Success', 'User registered successfully');
        CustomAlertBox.showSuccess(context, 'Success', response['message']);
        Timer(Duration(seconds:2), () => Navigator.pushNamed(context, '/login'));
    }else{
        CustomAlertBox.showError(context, 'Error', 'User registration failed');
    }}

    @override
  Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text('Register'),
            ),
            body: Column(
                children: [
                    Text('Register'),
                    TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            helperText: 'Enter your name',
                        ),
                    ),
                    TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            helperText: 'Enter your username',
                        ),
                    ),
                    TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            helperText: 'Enter your email',
                        ),
                    ),
                    TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            helperText: 'Enter your password',
                        ),
                    ),
                    ElevatedButton(
                        onPressed: handleRegister,
                        child: Text('Register'),
                    ),
                ]
            ),
        );
    }
}