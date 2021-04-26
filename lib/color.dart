import 'package:flutter/material.dart';
import './style_and_constant.dart';

enum Gender {
  male,
  female,
}

Color chooenColor(Gender gender) {
  return gender == Gender.male
      ? MaleButtonEnable
      : gender == Gender.female
          ? FemaleButtonEnable
          : Colors.white;
}
