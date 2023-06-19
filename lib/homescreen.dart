import 'package:fl_engineer_test/all-shipment.dart';
import 'package:fl_engineer_test/track.dart';
import 'package:flutter/material.dart';

import 'calculate.dart';
import 'home.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isVisible = false;
  bool isTextFieldFocused = false;
  int currentIndex = 0;
  int selectedTabIndex = 0;
  final FocusNode _focusNode =
      FocusNode(); // The index of the currently selected menu item

  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.calculate_outlined,
    Icons.history,
    Icons.person_outlined
  ];

  List<String> listOfLabels = [
    'Home',
    'Calculate',
    'Shipment',
    'Profile',
  ];

  getShipmentStatus<String>(tabSelected) {
    switch (tabSelected) {
      case 0:
        return "";
      case 1:
        return "completed";
      case 2:
        return 'in-progress';
      case 3:
        return 'pending';
      case 4:
        return 'cancelled';
    }
  }

  void onMenuItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late AnimationController _animationController;
  late Animation<double> _animation;
  String _shippingNumber = "";
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 10),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // TextField is focused
      print('TextField is focused');
      setState(() {
        isTextFieldFocused = true;
      });
    } else {
      // TextField lost focus
      setState(() {
        isTextFieldFocused = false;
      });
      print('TextField lost focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<BottomNavigationBarItem> bottomNavBarItems = List.generate(
      listOfIcons.length,
      (index) => BottomNavigationBarItem(
        icon: Icon(
          listOfIcons[index],
          color: currentIndex == index ? Color(0xff553A9D) : Colors.black38,
        ),
        label: listOfLabels[index],
      ),
    );

    List<Widget> overlayItems = List.generate(
      listOfIcons.length,
      (index) => Positioned(
        left:
            (index * (MediaQuery.of(context).size.width / listOfIcons.length)) +
                (MediaQuery.of(context).size.width / listOfIcons.length / 2) -
                20, // Adjust the position of the labels
        bottom: 12, // Adjust the vertical position of the labels
        child: Text(
          listOfLabels[index],
          style: TextStyle(
            color: currentIndex == index ? Colors.yellow : Colors.black,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: _getAppBarWidget(size),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: _getBodyWidget(),
      ),
      bottomNavigationBar: currentIndex == 2 || currentIndex == 1
          ? SizedBox()
          : Stack(
              children: [
                BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: onMenuItemTapped,
                  items: bottomNavBarItems,
                  showSelectedLabels: true, 
                  showUnselectedLabels: true,
                  unselectedItemColor:
                      Colors.black,
                      selectedItemColor: Color(0xff553A9D),
                       selectedLabelStyle: TextStyle(color: Color(0xff553A9D),
                       fontSize: 14
                       ), 
                        unselectedLabelStyle: TextStyle(color: Color(0xff553A9D),
                       fontSize: 14
                       ),// Set the color of the unselected items
                  // itemStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                Positioned(
                  left: (currentIndex *
                      (MediaQuery.of(context).size.width / listOfIcons.length)),
                  top: 1,
                  child: Container(
                    height: 3,
                    width:
                        MediaQuery.of(context).size.width / listOfIcons.length,
                    color: Color(0xff553A9D),
                  ),
                ),
              ],
            ),
    );
  
  }

  Widget buildTabItem(int index, IconData icon, String title, String count) {
    final isSelected = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
          // Add top padding of 10 pixels
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.yellow[900]! : Colors.transparent,
                width: 4.0,
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(.4),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  count.isEmpty
                      ? SizedBox()
                      : Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isSelected
                                ? Colors.yellow[900]
                                : Colors.white.withOpacity(
                                    .1), // Customize the background color of the container
                          ),
                          child: Center(
                            child: Text(
                              count,
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white.withOpacity(.3),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 8,
              )
            ],
          )),
    );
  }

  PreferredSizeWidget _getAppBarWidget(size) {
    switch (currentIndex) {
      case 0:
        return PreferredSize(
          preferredSize: isTextFieldFocused
              ? Size.fromHeight(size.height / 12)
              : Size.fromHeight(size.height / 5),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff553A9D),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      isTextFieldFocused
                          ? SizedBox(height: 0)
                          : Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage('assets/vectors/user.png'),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Transform.rotate(
                                        angle: 15 *
                                            (22 / 7) /
                                            95, // Adjust the angle as per your requirement
                                        child: Icon(
                                          Icons
                                              .navigation_rounded, // Replace with the desired icon
                                          color: Colors.white.withOpacity(
                                              .4), // Replace with the desired color
                                          size:
                                              20, // Replace with the desired size
                                        ),
                                      ),
                                      Text(
                                        'Your location',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white.withOpacity(.4),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                        Text(
                                          'Wertheimer, Illinois',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white, // Customize the background color of the container
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                          "assets/vectors/notify.png",
                                          height: 30)),
                                ),
                                // IconButton(
                                //   icon: Icon(Icons.notifications),
                                //   color: Colors.white,
                                //   onPressed: () {
                                //     // Handle notification icon press
                                //   },
                                // ),
                              ],
                            ),
                      isTextFieldFocused
                          ? SizedBox(height: 0)
                          : SizedBox(
                              height: size.height / 40,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          !isTextFieldFocused
                              ? SizedBox(height: 0)
                              : Transform.rotate(
                                  angle: 88 *
                                      (22 / 7) /
                                      25, // Adjust the angle as per your requirement
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isTextFieldFocused = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.expand_less_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Color(0xff553A9D),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onTap: () {
                                        setState(() {
                                          isTextFieldFocused = true;
                                        });
                                      },
                                      onEditingComplete: () {
                                        setState(() {
                                          isTextFieldFocused = false;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _shippingNumber = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            'Enter the receipt number ...',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Image.asset(
                                      "assets/vectors/search_receipt.png",
                                      height: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );
      case 1:
        return PreferredSize(
          preferredSize: Size.fromHeight(size.height / 12),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff553A9D),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 88 *
                              (22 / 7) /
                              25, // Adjust the angle as per your requirement
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext build) =>
                                          HomeScreen()));
                            },
                            icon: Icon(
                              Icons.expand_less_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      case 2:
        return PreferredSize(
          preferredSize: Size.fromHeight(size.height / 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff553A9D),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 88 *
                              (22 / 7) /
                              25, // Adjust the angle as per your requirement
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext build) =>
                                          HomeScreen()));
                            },
                            icon: Icon(
                              Icons.expand_less_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Text(
                            "Shipment history",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding:const EdgeInsets.symmetric(vertical: 10.0) 
                    
                    ,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: buildTabItem(
                                0, Icons.check_circle, 'All', '12'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: buildTabItem(
                                1, Icons.check_circle, 'Completed', '5'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: buildTabItem(
                                2, Icons.check_circle, 'In progress', '3'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: buildTabItem(
                                3, Icons.check_circle, 'Pending order', '4'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: buildTabItem(
                                4, Icons.check_circle, 'Cancelled', ''),
                          ),
                        ],
                      ),
                    ),
                  ),
                   
                  ],
                ),
              ),
            ),
          ),
        );

      case 3:
        return PreferredSize(
          preferredSize: isTextFieldFocused
              ? Size.fromHeight(size.height / 14)
              : Size.fromHeight(size.height / 6),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff553A9D),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      isTextFieldFocused
                          ? SizedBox(height: 0)
                          : Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage('assets/vectors/user.png'),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Transform.rotate(
                                        angle: 15 *
                                            (22 / 7) /
                                            95, // Adjust the angle as per your requirement
                                        child: Icon(
                                          Icons
                                              .navigation_rounded, // Replace with the desired icon
                                          color: Colors.white.withOpacity(
                                              .4), // Replace with the desired color
                                          size:
                                              20, // Replace with the desired size
                                        ),
                                      ),
                                      Text(
                                        'Your location',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white.withOpacity(.4),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                        Text(
                                          'Wertheimer, Illinois',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white, // Customize the background color of the container
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                          "assets/vectors/notify.png",
                                          height: 30)),
                                ),
                                // IconButton(
                                //   icon: Icon(Icons.notifications),
                                //   color: Colors.white,
                                //   onPressed: () {
                                //     // Handle notification icon press
                                //   },
                                // ),
                              ],
                            ),
                      isTextFieldFocused
                          ? SizedBox(height: 0)
                          : SizedBox(
                              height: size.height / 40,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Color(0xff553A9D),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      focusNode: _focusNode,
                                      decoration: InputDecoration(
                                        hintText:
                                            'Enter the receipt number ...',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Image.asset(
                                      "assets/vectors/search_receipt.png",
                                      height: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );

      default:
        return PreferredSize(
          child: Container(),
          preferredSize: isTextFieldFocused
              ? Size.fromHeight(size.height / 14)
              : Size.fromHeight(size.height / 6),
        );
    }
  }

  Widget _getBodyWidget() {
    switch (currentIndex) {
      case 0:
        return isTextFieldFocused
            ? FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeIn,
                  ),
                ),
                child: Track(
                    shippingNumber:
                        _shippingNumber), // Replace with your search widget
              )
            : home();
        ;
      case 1:
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeIn,
            ),
          ),
          child: calculate(), // Replace with your search widget
        );
      case 2:
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeIn,
            ),
          ),
          child: shipment(
              selectedTab: getShipmentStatus(
                  selectedTabIndex)), // Replace with your profile widget
        );
      default:
        return Container();
    }
  }
}
