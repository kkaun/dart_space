import 'package:dart_space/util/theme_data.dart';
import 'package:flutter/material.dart';

final gradients = [
    _linearGradientFrom(Colors.blue, Colors.green),
    _linearGradientFrom(Colors.red, Colors.orange),
    _linearGradientFrom(Colors.deepPurple, Colors.deepOrangeAccent),
    _linearGradientFrom(Colors.teal, Colors.cyan),
    _linearGradientFrom(HexColor('#ffafbd'), HexColor('#ffc3a0')),
    _linearGradientFrom(HexColor('#2193b0'), HexColor('#6dd5ed')),
    _linearGradientFrom(HexColor('#cc2b5e'), HexColor('#753a88')),
    _linearGradientFrom(HexColor('#ee9ca7'), HexColor('#ffdde1')),
    _linearGradientFrom(HexColor('#42275a'), HexColor('#734b6d')),
    _linearGradientFrom(HexColor('#bdc3c7'), HexColor('#2c3e50')),
    _linearGradientFrom(HexColor('#56ab2f'), HexColor('#a8e063')),
    _linearGradientFrom(HexColor('#eacda3'), HexColor('#d6ae7b')),
    _linearGradientFrom(HexColor('#000428 '), HexColor('#004e92')),
    _linearGradientFrom(HexColor('#4568dc'), HexColor('#b06ab3')),
    _linearGradientFrom(HexColor('#ffd89b'), HexColor('#19547b')),
    _linearGradientFrom(HexColor('#c33764'), HexColor('#1d2671')),
    _linearGradientFrom(Colors.blueGrey, HexColor('#243b55')),
    _linearGradientFrom(HexColor('#ed4264'), HexColor('#ffedbc')),
    _linearGradientFrom(HexColor('#aa076b'), HexColor('#61045f'))
  ];


LinearGradient _linearGradientFrom(Color colorOne, Color colorTwo) {
  return LinearGradient(
      colors: [
        colorOne,
        colorTwo,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
}