import 'package:flutter/material.dart';
import 'dart:html';
import 'package:tis_script/model/model.dart';

extension HoverExtension on Widget {
  static final container = window.document.getElementById('container');

  Widget get showPointerOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        container.style.cursor = 'pointer';
      },
      onExit: (event) {
        container.style.cursor = 'default';
      },
    );
  }

  Widget get showDragOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        container.style.cursor = 'move';
      },
      onExit: (event) {
        container.style.cursor = 'default';
      },
    );
  }
}

Output evaluateGraph(List<Node> _nodes, int noOfNodes) {
  List<String> output;

  for (var i = 0; i < noOfNodes; i++) {
    output.add(convertNodesToCode(_nodes[i]) + '\n');
  }
  return Output();
}

String convertNodesToCode(Node node) {
  if (node.type == NodeType.Math) {
    if (node.name == 'add') {
      return (double.parse(node.input['First']) +
              double.parse(node.input['Second']))
          .toString();
    } else if (node.name == 'subtract') {
      return (double.parse(node.input['First']) -
              double.parse(node.input['Second']))
          .toString();
    } else if (node.name == 'multiply') {
      return (double.parse(node.input['First']) *
              double.parse(node.input['Second']))
          .toString();
    } else if (node.name == 'divide (combined)') {
      return (double.parse(node.input['First']) /
              double.parse(node.input['Second']))
          .toString();
    } else if (node.name == 'divide (question)') {
      return (double.parse(node.input['First']) /
              double.parse(node.input['Second']))
          .round()
          .toString();
    } else if (node.name == 'divide (remainder)') {
      return (double.parse(node.input['First']) %
              double.parse(node.input['Second']))
          .toString();
    } else if (node.name == 'not') {
      return (node.input['First'].toLowerCase() != 'true').toString();
    }
  }
  return '';
}
