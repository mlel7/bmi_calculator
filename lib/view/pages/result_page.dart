import 'package:bmi_claculator/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      "Your Result",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(14),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(controller.result,
                            style:  TextStyle(
                              fontSize: 26,
                              color: controller.resultColor,
                            )),
                        Text(controller.bmi.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            controller.advice,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14,color: Color(0xFF8D8E98)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                
                Expanded(
          
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        minimumSize: const Size(double.infinity, 90),
                        backgroundColor: const Color(0xFFEB1555),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        
                        ),
                      ),
                      child: const Text("Calculate Again",style: TextStyle(color: Colors.white,fontSize: 25)),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
