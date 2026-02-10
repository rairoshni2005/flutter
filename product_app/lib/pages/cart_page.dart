import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  _cartItem(),
                  _cartItem(),
                  const Spacer(),
                  _checkoutBox(),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }

  Widget _cartItem() {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Image.asset("assets/milk_chocolate.jpg", width: 60),
        title: const Text("Milk Chocolate"),
        subtitle: const Text("₹119"),
        trailing: const Icon(Icons.delete),
      ),
    );
  }

  Widget _checkoutBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total: ₹238",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Checkout"),
          )
        ],
      ),
    );
  }
}
