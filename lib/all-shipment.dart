import 'package:fl_engineer_test/models/shipments.dart';
import 'package:flutter/material.dart';

class shipment extends StatefulWidget {
  final String selectedTab;
  const shipment({super.key, required this.selectedTab});

  @override
  State<shipment> createState() => _shipmentState();
}

class _shipmentState extends State<shipment>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  List<Shipments> filteredShipments = [];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
    updateFilteredShipments();
  }

  @override
  void didUpdateWidget(shipment oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedTab != oldWidget.selectedTab) {
      _animationController.reset();
      _animationController.forward();
      updateFilteredShipments();
    }
  }

  void updateFilteredShipments() {
    setState(() {
      filteredShipments = sortShipmentsByStatus(widget.selectedTab);
    });
  }

  List<Shipments> sortShipmentsByStatus(String status) {
    List<Shipments> matchedList = [];
    List<Shipments> remainingList = [];

    for (var shipment in shipments_) {
      if (shipment.status == status) {
        matchedList.add(shipment);
      } else {
        remainingList.add(shipment);
      }
    }
    if (!status.isEmpty) {
      return matchedList;
    } else {
      return shipments_;
    }

    // [...matchedList, ...remainingList];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String selectedStatus = '';
  List<Shipments> shipments_ = [
    Shipments(
        status: 'in-progress',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'pending',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'pending',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'loading',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'loading',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'in-progress',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
    Shipments(
        status: 'in-progress',
        title: 'Arriving today!',
        subTitle:
            'Your delivery #NEJ20089934122231 \n from Atlanta, is arriving today!',
        amount: '\$1400 USD',
        deliveryDate: 'Sep 20,2023'),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(_slideAnimation),
      child: Container(
        color: Color(0xffFBFAF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Shipments ",
                      style: TextStyle(
                        color: Color(0xff00094B),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredShipments.length,
                itemBuilder: (BuildContext context, int index) {
                  Shipments shipment = filteredShipments[index];
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: size.height / 4.0,
                          width: size.width / 1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // SizedBox(width: 10),
                                            shipment.status == 'in-progress'
                                                ? Image.asset(
                                                    "assets/vectors/refresh.png",
                                                    height: 30,
                                                    width: 20,
                                                  )
                                                : shipment.status == 'pending'
                                                    ? Icon(Icons.history,
                                                        color:
                                                            Colors.yellow[900])
                                                    : shipment.status ==
                                                            'loading'
                                                        ? Image.asset("assets/vectors/properloading.png",
                                                            height: 
                                                            25,)
                                                        : Container(),
                                            SizedBox(width: 5),
                                            shipment.status ==
                                                        'loading'?SizedBox():
                                            Text(
                                              shipment.status,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: shipment.status ==
                                                        'loading'
                                                    ? Colors.purple[900]
                                                    : shipment.status ==
                                                            'pending'
                                                        ? Colors.yellow[900]
                                                        : shipment.status ==
                                                                'in-progress'
                                                            ? Colors.green
                                                            : Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              shipment.title,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Container(
                                              width: size.width / 1.6,
                                              child: Text(
                                                shipment.subTitle,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      "assets/vectors/ship.png",
                                      height: 50,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      shipment.amount,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff553A9D),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 6.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      shipment.deliveryDate,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
