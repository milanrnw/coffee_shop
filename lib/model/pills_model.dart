import 'package:flutter/material.dart';

class PillsModel {
  final String text;
  final IconData icon;
  bool isSelected;

  PillsModel({
    required this.text,
    required this.icon,
    this.isSelected = false,
  });
}