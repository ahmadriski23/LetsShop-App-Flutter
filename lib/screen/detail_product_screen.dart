import 'package:flutter/material.dart';
import 'package:lets_app/model/products.dart';

class DetailProductScreen extends StatefulWidget {
  final Products products;
  const DetailProductScreen({super.key, required this.products});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  bool isBuy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.products.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Text(
                widget.products.productName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade800, size: 18),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    '125 Review',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Text(
                widget.products.description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Text(
                widget.products.price,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: isBuy
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              setState(() {
                                isBuy = !isBuy;
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              Colors.yellow.shade700,
                                          content: const Text(
                                            'Ooppss!! Products has been canceled',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )));
                                });
                              });
                            },
                            child: const Text(
                              'Products Has Been Buyed',
                              style: TextStyle(color: Colors.white),
                            ))
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.shade700),
                            onPressed: () {
                              setState(() {
                                isBuy = !isBuy;
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                              'Thank You for Shopping Here :)')));
                                });
                              });
                            },
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.black),
                            ))),
              ),
            )
          ],
        ),
      ])),
    );
  }
}
