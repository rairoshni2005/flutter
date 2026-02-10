import 'package:flutter/material.dart';
import '../widgets/product_card.dart';


class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // Sample related products (just for demo)
    final relatedProducts = [
      
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
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView( // 🌟 Scrollable
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "₹ $price",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD2691E),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🌟 Ingredients / Info
                  const Text(
                    "Ingredients:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "- Cocoa solids\n- Milk\n- Sugar\n- Nuts (if applicable)\n- Natural flavors",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // 🌟 Reviews
                  const Text(
                    "Customer Reviews:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "⭐️⭐️⭐️⭐️☆ - Loved the creamy texture!\n"
                    "⭐️⭐️⭐️⭐️⭐️ - Perfect chocolate for gifts.\n"
                    "⭐️⭐️⭐️⭐️☆ - Rich taste, slightly sweet.",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // 🌟 Related Products
                  const Text(
                    "Related Products:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: relatedProducts.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final p = relatedProducts[index];
                        return ProductCard(
                          name: p['name']!,
                          price: p['price']!,
                          image: p['image']!,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🌟 Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add to Cart"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
