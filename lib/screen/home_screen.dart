import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lets_app/model/products.dart';
import 'package:lets_app/screen/all_products_screen.dart';
import 'package:lets_app/screen/detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeLocalNotifications();
  }

  Future<void> initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showDiscountNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpesifics =
        AndroidNotificationDetails(
      '76662',
      'Lets Shop',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpesifics =
        NotificationDetails(android: androidPlatformChannelSpesifics);
    await flutterLocalNotificationsPlugin.show(
      01,
      'Lets Diskon Besar Besaran!!',
      'Yeeyy!! You get discount up to 87%',
      platformChannelSpesifics,
    );
  }

  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              height: 175,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow.shade600),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lets Shop',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            'Find the laptop & accessories and get the discount 70%',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          InkWell(
                            onTap: () => showDiscountNotification(),
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Colors.black38,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(1, 1))
                                  ],
                                  color: Colors.black),
                              child: const Center(
                                child: Text(
                                  'Get Discount!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.laptop_mac_outlined,
                            color: Colors.black,
                            size: 70,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllProductsScreen())),
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productsList.length - 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                    backgroundColor:
                                                        Colors.yellow.shade700,
                                                    content: const Text(
                                                      'Product have added!',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )))
                                            : ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      'Product have removed!',
                                                      style: TextStyle(
                                                          color: Colors.white),
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
                })
          ],
        ),
      ),
    );
  }
}
