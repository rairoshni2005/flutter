import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/category_bar.dart';
import '../widgets/section_title.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';
import 'product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "name": "Milk Chocolate",
        "price": "119",
        "image": "assets/milk_chocolate.jpeg"
      },
      {
        "name": "Dark Chocolate",
        "price": "199",
        "image": "assets/dark_chocolate.jpeg"
      },
      {
        "name": "White Chocolate",
        "price": "179",
        "image": "assets/white_chocolate.jpeg"
      },
      {
        "name": "Hazelnut Chocolate",
        "price": "249",
        "image": "assets/hazelnut_chocolate.jpeg"
      },
      {
        "name": "Caramel Chocolate",
        "price": "199",
        "image": "assets/caramel_chocolate.jpeg"
      },
      {
        "name": "Chocolate Bar",
        "price": "99",
        "image": "assets/chocolate_bar.jpeg"
      },
      {
        "name": "Chocolate Cake",
        "price": "349",
        "image": "assets/chocolate_cake.jpeg"
      },
      {
        "name": "Chocolate Cookies",
        "price": "149",
        "image": "assets/chocolate_cookies.jpeg"
      },
      {
        "name": "Chocolate Fudge",
        "price": "229",
        "image": "assets/chocolate_fudge.jpeg"
      },
      {
        "name": "Hot Chocolate",
        "price": "159",
        "image": "assets/hot_chocolate.jpeg"
      },
      {
        "name": "Chocolate Truffles",
        "price": "299",
        "image": "assets/truffles.jpeg"
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            const HeroSection(),
            const CategoryBar(),

            const SizedBox(height: 40),

            const SectionTitle(title: "Featured Chocolates"),
            _productGrid(context, products),

            const SectionTitle(title: "Best Sellers"),
            _productGrid(context, products.reversed.toList()),

            const SectionTitle(title: "New Arrivals"),
            _productGrid(context, products),

            const SizedBox(height: 60),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _productGrid(BuildContext context, List products) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
            name: p['name'],
            price: p['price'],
            image: p['image'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(
                    name: p['name'],
                    description: "Premium handcrafted chocolate made with love & cocoa.",
                    price: p['price'],
                    image: p['image'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
