import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    final startPosition = Offset(1.0, 0.0);
    final endPosition = Offset.zero;

    _animation = Tween<Offset>(
      begin: startPosition,
      end: endPosition,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
 WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
 
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isl = true;
  Widget loadAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    final startPosition = Offset(1.0, 0.0);
    final endPosition = Offset.zero;

    _animation = Tween<Offset>(
      begin: startPosition,
      end: endPosition,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
    return SizedBox(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Color(0xffFBFAF),
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // isl ? loadAnimation() : SizedBox(height: 0),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Tracking",
                  style: TextStyle(
                      color: Color(0xff00094B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      height: size.height / 2.8,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text(
                                        'Shipment Number',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        Text(
                                          'NEJ20089934122231',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/vectors/shipment.png",
                                  height: 50,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage(
                                              'assets/vectors/sender.png'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sender',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Atlanta, 5243',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(width: size.width / 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Time',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Container(
                                              width: 6.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                            Text(
                                              ' 2 day -3 days',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage(
                                              'assets/vectors/receiver.png'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Receiver',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Chicago, 6342',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(width: size.width / 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Waiting to collect',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                              
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child:TextButton.icon(
                              onPressed: () {
                                // Handle button press
                              },
                              icon: Icon(Icons.add, color: Color(0xffF78429)),
                              label: Text(
                                'Add Stop',
                                style: TextStyle(
                                    color: Color(0xffF78429),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                         
                          )
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Available Vehicles",
                  style: TextStyle(
                      color: Color(0xff00094B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 180,
              width: double.infinity,
              child: SlideTransition(
                position: _animation,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            left: 15.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ocean fright',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff00094B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'International',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black.withOpacity(.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 30.0,
                              right: 15.0,
                              child: Image.asset(
                                  "assets/vectors/ocean_fright.png",
                                  height: 100))
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            left: 15.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cargo freight',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff00094B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Reliable',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black.withOpacity(.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 30.0,
                              right: 15.0,
                              child: Image.asset(
                                  "assets/vectors/cargo_fright.png",
                                  height: 100))
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            left: 15.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Air fright',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'International',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black.withOpacity(.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 30.0,
                              right: 15.0,
                              child: Image.asset(
                                  "assets/vectors/ocean_fright.png",
                                  height: 100))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Text(
          //       'Selected Index: $currentIndex',
          //       style: TextStyle(fontSize: 24),
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  
  }
}
