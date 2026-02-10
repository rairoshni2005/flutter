import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/shop_page.dart';
import 'pages/cart_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chocolate Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
        primaryColor: const Color(0xFFD2691E),
        fontFamily: 'Arial',
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/shop': (_) => const ShopPage(),
        '/cart': (_) => const CartPage(),
        '/about': (_) => const AboutPage(),
      },
    );
  }
}
