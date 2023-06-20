import 'package:flutter/material.dart';
import 'calculate-result.dart';

class calculate extends StatefulWidget {
  const calculate({super.key});

  @override
  State<calculate> createState() => _calculateState();
}

class _calculateState extends State<calculate> {
  String dropdownValue = 'Box';
  List<String> dropdownItems = ['Box', 'Box 2', 'Box 3'];
  List<String> selectedOptions = [];
  List<String> options = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others'
  ];

  bool isSelected(String option) {
    return selectedOptions.contains(option);
  }

  void toggleSelection(String option) {
    setState(() {
      if (isSelected(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  Widget buildOption(String option) {
    final isSelected = this.isSelected(option);

    return GestureDetector(
      onTap: () => toggleSelection(option),
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.black,
            width: 2,
          ),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected
                ? Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 15,
                  )
                : SizedBox(),
            Text(
              option,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              child: Text("Destination",
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
                      height: 200,
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
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            "assets/vectors/upcoming.png",
                                            height: 30),
                                        Container(
                                          width: 1,
                                          height: 24,
                                          color: Colors.black,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Sender location',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            "assets/vectors/incoming.png",
                                            height: 30),
                                        Container(
                                          width: 1,
                                          height: 24,
                                          color: Colors.black,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Receiver location',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/vectors/weight.png",
                                            height: 30),
                                        Container(
                                          width: 1,
                                          height: 24,
                                          color: Colors.black,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Approx weight',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
          ListTile(
            title: Text(
              "Packaging",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                  top:
                      8), // Adjust the top padding to position the subtitle lower
              child: Text("What are you sending?"),
            ),
          ),

          SizedBox(
            height: 5,
          ),
          Container(
            width: size.width / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Box',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        prefixIcon: Container(
                          width: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/vectors/calculate.png",
                                  height: 30),
                              SizedBox(width: 5),
                              Container(
                                width: 1,
                                height: 24,
                                color: Colors.black,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                            ],
                          ),
                        ),
                        suffixIcon: Transform.rotate(
                          angle: 25 * (22 / 7) / 25,
                          child: Icon(Icons.expand_less_outlined,
                              color: Colors.black38),
                        ), // Change the icon here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: DropdownButton<String>(
                                value: dropdownValue,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                  Navigator.of(context).pop();
                                },
                                items: dropdownItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                  top:
                      8), // Adjust the top padding to position the subtitle lower
              child: Text("What are you sending?"),
            ),
          ),

          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: options.map((option) => buildOption(option)).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print("tapped");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext build) => CalculateResult()));
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
                          builder: (BuildContext build) => CalculateResult()));

                  // Add your button action here
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
 // Positioned(
          //   left: (currentIndex *
          //           (MediaQuery.of(context).size.width / listOfIcons.length)),
          //   top: 1,
          //   child: Container(
          //     height: 3,
          //     width: MediaQuery.of(context).size.width / listOfIcons.length,
          //     color: Color(0xff553A9D),
          //   ),
          // ),
        