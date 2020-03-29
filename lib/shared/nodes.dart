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
  int get height => super.height;

  @override
  int get width => super.width;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeType get type => NodeType.Math;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);

  @override
  Widget toWidget({double offsetX, double offsetY}) {
    return super.toWidget(offsetX: offsetX, offsetY: offsetY);
  }
}
