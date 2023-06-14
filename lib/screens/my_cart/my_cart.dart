import 'package:flutter/material.dart';
import 'package:networking_assignment_3/screens/my_cart/widgets/amount_details_card.dart';

import '../../model/cart_model.dart';

class MyCart extends StatefulWidget {
  final Cart cart;
  const MyCart({Key? key, required this.cart}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                  itemCount: widget.cart.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 186),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/img${index.toString()}.jpg",
                                height: 100,
                                width: 90,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(widget.cart.products[index].title),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 15,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                              ),
                              child: Center(
                                  child: Text(
                                "${widget.cart.products[index].discountPercentage}% Off",
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.orange),
                              )),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "৳ ${widget.cart.products[index].price.toString()}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.cart.products[index].discountPercentage
                                      .toString(),
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
              height: 210,
              child: AmountDetailsCard(
                total: widget.cart.total!,
                discountedTotal: widget.cart.discountedTotal!,
                totalProducts: widget.cart.totalProducts!,
                totalQuantity: widget.cart.totalQuantity!,
              ))
        ],
      ),
    );
  }
}
