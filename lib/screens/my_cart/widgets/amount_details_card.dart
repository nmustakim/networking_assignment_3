import 'package:flutter/material.dart';

class AmountDetailsCard extends StatelessWidget {
  final int total;
  final int discountedTotal;
  final int totalProducts;
  final int totalQuantity;

  const AmountDetailsCard({
    super.key,
    required this.discountedTotal,
    required this.total,
    required this.totalProducts,
    required this.totalQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Amount Details#',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const Divider(),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text("${total.toString()} TK")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discounted total',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text("${discountedTotal.toString()} TK")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Products',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(totalProducts.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Quantity',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(totalQuantity.toString())
              ],
            ),
            const SizedBox(height: 5.0),
            const Divider(),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${discountedTotal.toString()} TK",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
