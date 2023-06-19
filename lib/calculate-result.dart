import 'package:fl_engineer_test/homescreen.dart';
import 'package:flutter/material.dart';

class CalculateResult extends StatefulWidget {
  const CalculateResult({super.key});

  @override
  State<CalculateResult> createState() => _CalculateResultState();
}

class _CalculateResultState extends State<CalculateResult>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final int startValue = 1091;
  final int endValue = 14300;
  final Duration duration = Duration(seconds: 5);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: duration,
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _animation = Tween<double>(
      begin: startValue.toDouble(),
      end: endValue.toDouble(),
    ).animate(curvedAnimation);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFBFAFB),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/vectors/logo.png"),
            SizedBox(
              height: size.height / 40,
            ),
            Image.asset(
              "assets/vectors/result-calculate.png",
              height: size.height / 6,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              "Total Estimated Amount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
 AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text(
              '\$${_animation.value.toInt()}',
              style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.green
              ),
            );
          },),
          SizedBox(width: 2,),
          Column(
            
            children: [
              SizedBox(height: 2,),
Text("USD",
              style: TextStyle(
                fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green
              ),),
            ],
          )
            
  ],
),
           
            SizedBox(
              height: 10,
            ),
            Text(
              "This amount is estimated this will vary\n if you change your location or weight",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext build) => HomeScreen()));
              },
              child: Container(
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.yellow[900],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext build) =>
                              HomeScreen()));

                    // Add your button action here
                  },
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
