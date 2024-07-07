// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/gender_enum.dart';
class HomeController extends GetxController{
  int height = 158;
  int weight = 0;
  int age = 0;
  Gender? gender;
  String result = "NORMAL";
  Color resultColor = Colors.green;
  double bmi = 0;
  String advice = "Your BMI is in the normal You can eat whatever you want";
  changeGender(Gender _gender){
    gender = _gender;
    update();
  }
  sliderChange(double value){
    height = value.round();
    update();
  }
  incrementWeight(){
    weight++;
    update();
  }
  incrementAge(){
    age++;
    update();
  }
  decrementWeight(){
    if(weight > 0){
      weight--;
      update();
    }
  }
  decrementAge(){
    if(age > 0){
      age--;
      update();
    }
  }

  calculateBMI(){
    bmi = weight / pow(height/100, 2);
    if (bmi >= 25){
      result = "OVERWEIGHT";
      resultColor = Colors.red;
      advice = "You have a higher body weight than other, You Can do more exercises";
    }
    else if (bmi > 18.5){
      result = "NORMAL";
      resultColor = Colors.green;
      advice = "Your BMI is in the normal You can eat whatever you want, Great Job!";
    }
    else{
      result = "UNDERWEIGHT";
      resultColor = Colors.amber;
      advice = "You have a lower body weight than other, You should eat more";
    }
    update();
  }
  
}