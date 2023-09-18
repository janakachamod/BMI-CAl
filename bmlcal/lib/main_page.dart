import 'package:bmlcal/constants.dart';
import 'package:flutter/material.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  int height = 150;
  int weight = 70;
  late double BMI = calculateBMI(height: height, weight: weight);
  String gender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male")
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                  ),
                  Container(
                    height: 200,
                    width: 175,
                    decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.female,
                          size: 150,
                        ),
                        Text("Female")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text("$height", style: KInputLabelColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  BMI = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  BMI = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text("$weight", style: KInputLabelColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 35) weight--;
                                  BMI = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 300) weight++;
                                  BMI = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    "${BMI.toStringAsFixed(2)}",
                    style: KInputLabelColor.copyWith(
                        color: KOutputTextColor, fontSize: 50),
                  ),
                  Text(getResult(BMI))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / (height * height) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
}
