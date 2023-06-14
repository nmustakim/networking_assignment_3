
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String title, price, image;
 final Widget quantityRow;
  const CustomCard(
      {Key? key,
      required this.title,
      required this.price,
      required this.quantityRow, required this.image})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                  child: Text(widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              Image.asset(
                widget.image,
                height: 80,
                width: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Text(widget.price),
                  Container(
                    height: 22,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300),
                    child: widget.quantityRow
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
