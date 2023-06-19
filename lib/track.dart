import 'package:fl_engineer_test/models/products.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  final String shippingNumber;
  const Track({super.key, required this.shippingNumber});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  final List<Products> productList = [
    Products(
        productName: 'Macbook pro M2',
        shippingNumber: '#NE43857340857904',
        location: ' • Paris -> Morocco'),
    Products(
        productName: 'Summer linen jacket',
        shippingNumber: '#NEJ20089934122231',
        location: ' • Barcelona -> Paris'),
    Products(
        productName: 'Tapered-fit jeans AW',
        shippingNumber: '#NEJ35870264978659',
        location: ' • Colombia -> Paris'),
    Products(
        productName: 'Slim fit jeans AW',
        shippingNumber: '#NEJ35870264978659',
        location: ' • Bogota -> Dhaka'),
    Products(
        productName: 'Office setup desk',
        shippingNumber: '#NEJ23481570754963',
        location: ' • France -> German'),
    // Add more items as needed
  ];
List<Products> sortedProductList = [];

  @override
  void initState() {
    super.initState();
    sortedProductList = sortProductsByShippingNumber(widget.shippingNumber);
  }

  @override
  void didUpdateWidget(Track oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.shippingNumber != widget.shippingNumber) {
      sortedProductList = sortProductsByShippingNumber(widget.shippingNumber);
    }
  }

  List<Products> sortProductsByShippingNumber(String shippingNumber) {
    List<Products> matchedList = [];
    List<Products> remainingList = [];

    for (var product in productList) {
      if (product.shippingNumber.contains(shippingNumber)) {
        matchedList.add(product);
      } else {
        remainingList.add(product);
      }
    }

    return [...matchedList, ...remainingList];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Color(0xffFBFAF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 2.9,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: sortedProductList.length,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            final item = sortedProductList[index];

                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff553A9D),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/vectors/tracking.png",
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    item.productName,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(item.shippingNumber + item.location),
                                  ),
                                ),
                                if (index != productList.length - 1) Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
