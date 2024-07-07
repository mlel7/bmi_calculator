// ignore_for_file: library_private_types_in_public_api
import 'package:bmi_claculator/model/gender_enum.dart';
import 'package:bmi_claculator/model/page_routs.dart';
import 'package:bmi_claculator/view/widgets/cards/gender_card.dart';
import 'package:bmi_claculator/view/widgets/cards/my_card.dart';
import 'package:bmi_claculator/view/widgets/cards/slider_card.dart';
import 'package:bmi_claculator/view/widgets/cards/value_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
      ),
      drawer: const Drawer(),
      body: GetBuilder(
        init: HomeController(),
        autoRemove: false,
        builder: (controller) => Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    GenderCard(
                      icon: Icons.male,
                      color: controller.gender == Gender.male
                          ? Theme.of(context).cardColor
                          : Theme.of(context).hoverColor,
                      label: 'MALE',
                      onTap: () {
                        controller.changeGender(Gender.male);
                      },
                    ),
                    const SizedBox(width: 5),
                    GenderCard(
                      icon: Icons.female,
                      color: controller.gender == Gender.female
                          ? Theme.of(context).cardColor
                          : Theme.of(context).hoverColor,
                      label: 'FEMALE',
                      onTap: () {
                        controller.changeGender(Gender.female);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: MyCard(
                  color: const Color(0xFF1D1E33),
                  child: SliderCard(
                    color: const Color(0xFFEB1555),
                    height: controller.height,
                    onChanged: (double value) {
                      controller.sliderChange(value);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyCard(
                        color: const Color(0xFF1D1E33),
                        child: ValueCard(
                          label: 'WEIGHT',
                          value: controller.weight,
                          onIncrement: () {
                            controller.incrementWeight();
                          },
                          onDecrement: () {
                            controller.decrementWeight();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: MyCard(
                        color: const Color(0xFF1D1E33),
                        child: ValueCard(
                          label: 'AGE',
                          value: controller.age,
                          onIncrement: () {
                            controller.incrementAge();
                          },
                          onDecrement: () {
                            controller.decrementAge();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  onPressed: () {
                    if (controller.weight > 15 && controller.age > 0) {
                      controller.calculateBMI();
                      Get.toNamed(Routes.result);
                    } else {
                      Get.snackbar("Feild","Weight Must be ");
                    }
                  },
                  color: const Color(0xFFEB1555),
                  hoverColor: const Color(0xFFF71659),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  child: const Text("Check Your BMI",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
