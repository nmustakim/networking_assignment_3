import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:networking_assignment_3/screens/my_cart/my_cart.dart';

import '../model/cart_model.dart';
import 'package:http/http.dart' as http;

class CartService {
  static Future<Cart> addToCart(List<Product> products, context) async {
    final url = Uri.parse('https://dummyjson.com/carts/add');
    final headers = {'Content-Type': 'application/json'};

    final cart = Cart(
      userId: 1,
      products: products,
    );

    final body = jsonEncode(cart.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = Cart.fromJson(jsonDecode(response.body));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyCart(cart: responseData)));

        return cart;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Failed!. Status code: ${response.statusCode}")));

        throw Exception('Failed to proceed.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error!: $e")));

      throw Exception('Error!');
    }
  }
}
