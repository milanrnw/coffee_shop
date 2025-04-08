import 'package:flutter/material.dart';

class PillsModel {
  final String text;
  final IconData icon;
  final bool isSelected;

  const PillsModel({
    required this.text,
    required this.icon,
    this.isSelected = false,
  });
}