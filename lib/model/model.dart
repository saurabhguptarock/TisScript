import 'package:flutter/material.dart';
import 'package:tis_script/nodes.dart';

class Node {
  final String name = 'Tis Script';
  final NodeCategory category = NodeCategory.String;
  final NodeType type = NodeType.None;
  final int noOfInputs = 0;
  final int noOfOutputs = 0;
  final double height = 100;
  final double width = 150;
  final Color titleColor = Colors.orange;
  final bool isEditable = false;
  Map<String, dynamic> inputLocal = {};
  Map<String, dynamic> outputLocal = {};
  Offset nodePositionLocal = Offset.zero;

  set input(Map<String, dynamic> inp) {
    inputLocal = inp;
  }

  Map<String, dynamic> get input {
    return inputLocal;
  }

  set output(dynamic out) {
    outputLocal = Map.fromEntries([MapEntry('Output', out)]);
  }

  Map<String, dynamic> get output {
    return outputLocal;
  }

  set nodePosition(Offset i) {
    nodePositionLocal = i;
  }

  Offset get nodePosition {
    return nodePositionLocal;
  }
}

class Output {
  final bool hasError;
  final dynamic output;
  final NodeCategory outputType;

  Output({this.hasError, this.output, this.outputType});
}
