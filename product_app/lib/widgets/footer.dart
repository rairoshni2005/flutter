import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _FooterColumn(
                title: "Shop",
                items: ["All Chocolates", "Gift Boxes", "Combos"],
              ),
              _FooterColumn(
                title: "Company",
                items: ["About Us", "Careers", "Contact"],
              ),
              _FooterColumn(
                title: "Support",
                items: ["FAQs", "Shipping", "Returns"],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "© 2026 Chocolate Store. All Rights Reserved.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(e, style: const TextStyle(color: Colors.white70)),
          ),
        )
      ],
    );
  }
}
