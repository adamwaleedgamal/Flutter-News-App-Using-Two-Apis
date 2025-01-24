import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const CustomProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150, // Adjust width as needed
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              "\$$price",
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}