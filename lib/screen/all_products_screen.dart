import 'package:flutter/material.dart';

import '../model/products.dart';
import 'detail_product_screen.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          centerTitle: true,
          title: const Text(
            'All Products',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: productsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 9 / 15,
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      final products = productsList[index];
                      var image = productsList[index].imageUrl;
                      var productName = productsList[index].productName;
                      var description = productsList[index].description;
                      var price = productsList[index].price;
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailProductScreen(products: products))),
                          child: Container(
                            height: 275,
                            width: 225,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 6,
                                    spreadRadius: 5,
                                    offset: const Offset(1, 3))
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(image)),
                                        color: Colors.yellow.shade700),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    productName,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    description,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey.shade700,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        price,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 9,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            productsList[index].isAdded =
                                                !productsList[index].isAdded;
                                            productsList[index].isAdded
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor: Colors
                                                            .yellow.shade700,
                                                        content: const Text(
                                                          'Product have added!',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )))
                                                : ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                              'Product have removed!',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )));
                                          });
                                        },
                                        child: CircleAvatar(
                                            radius: 8,
                                            backgroundColor: Colors.black,
                                            child: productsList[index].isAdded
                                                ? const Icon(
                                                    Icons.done,
                                                    color: Colors.yellow,
                                                    size: 10,
                                                  )
                                                : const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 10,
                                                  )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          ]),
        ));
  }
}
