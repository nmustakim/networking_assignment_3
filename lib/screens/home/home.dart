import 'package:flutter/material.dart';
import 'package:networking_assignment_3/api_services/cart_service.dart';
import 'package:networking_assignment_3/screens/home/widgets/custom_cart.dart';
import '../../model/cart_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int iphone9Quantity = 0;
  int iphone9Price = 549;
 int iphoneXPrice = 899;
  int samsung9Price = 1249;
  int iphoneXQuantity = 0;
  int samsung9Quantity = 0;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    double total = iphone9Price * iphone9Quantity + iphoneXQuantity * iphoneXPrice + samsung9Quantity * samsung9Price.toDouble();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              '2 items',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomCard(
                title: "iPhone 9",
                price: "\$${iphone9Price.toString()}",
                quantityRow: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            iphone9Quantity++;
                          });
                        },
                        child: const Icon(Icons.add, size: 18)),
                    Text(iphone9Quantity.toString()),
                    InkWell(
                        onTap: () {
                          if (iphone9Quantity > 0) {
                            setState(() {
                              iphone9Quantity--;
                            });
                          }
                        },
                        child: const Icon(Icons.remove, size: 18))
                  ],
                ),
                image: "assets/images/img0.jpg",
              ),
              CustomCard(
                title: "iPhone X",
                price: "\$${iphoneXPrice.toString()}",
                quantityRow: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            iphoneXQuantity++;
                          });
                        },
                        child: const Icon(Icons.add, size: 18)),
                    Text(iphoneXQuantity.toString()),
                    InkWell(
                        onTap: () {
                          if (iphoneXQuantity > 0) {
                            setState(() {
                              iphoneXQuantity--;
                            });
                          }
                        },
                        child: const Icon(Icons.remove, size: 18))
                  ],
                ),
                image: "assets/images/img1.jpg",
              ),
              CustomCard(
                title: "Samsung Universe 9",
                price: "\$${samsung9Price.toString()}",
                quantityRow: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            samsung9Quantity++;
                          });
                        },
                        child: const Icon(Icons.add, size: 18)),
                    Text(samsung9Quantity.toString()),
                    InkWell(
                        onTap: () {
                          if (samsung9Quantity > 0) {
                            setState(() {
                              samsung9Quantity--;
                            });
                          }
                        },
                        child: const Icon(Icons.remove, size: 18))
                  ],
                ),
                image: "assets/images/img2.jpg",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sub total"),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(child: SizedBox()),
                  Text(
                    "(Total does not include shipping)",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.black),
                      onPressed: () async {

                        if(iphone9Quantity != 0 && iphoneXQuantity !=0 && samsung9Quantity != 0) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await CartService.addToCart([
                              Product(
                                  id: 1,
                                  title: 'iPhone 9',
                                  price: iphone9Price,
                                  quantity: iphone9Quantity),
                              Product(
                                  id: 2,
                                  title: 'iPhone X',
                                  price: iphoneXPrice,
                                  quantity: iphoneXQuantity),
                              Product(
                                  id: 3,
                                  title: 'Samsung Universe 9',
                                  price: samsung9Price,
                                  quantity: samsung9Quantity)
                            ], context);
                          }catch
                            (error){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));

                          }
                          finally{
                        setState(() {

                        isLoading = false;
                        });
                            }
    }

                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Quantity can't be zero!")));
                        }


                      },
                      child: isLoading
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                          : const Text("Check out")))
            ],
          ),
        ),
      ),
    );
  }
}
