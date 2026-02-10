import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';
import 'product_detail.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(8, (index) => {
          "name": "Chocolate Box ${index + 1}",
          "price": "299",
          "image": "assets/choco_box.jpg",
        });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            const SizedBox(height: 30),
            const Text(
              "Our Chocolates",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 260,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final p = products[index];
                  return ProductCard(
                    name: p['name']!,
                    price: p['price']!,
                    image: p['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            name: p['name']!,
                            description: "Luxury chocolate gift box",
                            price: p['price']!,
                            image: p['image']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
