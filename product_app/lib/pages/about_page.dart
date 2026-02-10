import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                children: const [
                  Text(
                    "About Our Chocolates",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "We craft premium chocolates using the finest cocoa beans. "
                    "Each piece is handmade with love, inspired by luxury and taste. "
                    "Our mission is to deliver happiness in every bite.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, height: 1.6),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
