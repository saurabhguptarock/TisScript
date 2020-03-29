import 'package:flutter/material.dart';
import 'package:tis_script/model/model.dart';

class Add extends Node {
  @override
  String get name => 'Add';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 130;

  @override
  double get width => 150;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Math;

  @override
  NodeType get type => NodeType.Add;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}
