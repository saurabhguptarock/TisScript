import 'package:flutter/material.dart';

class Node {
  final String name;
  final NodeType type;
  final int noOfInputs;
  final int noOfOutputs;
  final int height;
  final int width;
  final Color titleColor;
  final List<String> inputNames;
  final List<String> outputNames;

  Node(
      {this.name,
      this.type,
      this.noOfInputs,
      this.noOfOutputs,
      this.height,
      this.width,
      this.titleColor,
      this.inputNames,
      this.outputNames});
}

class NodeType {}
