import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';

extension HoverExtension on Widget {
  static final container = html.window.document.getElementById('container');

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

Output evaluateNode(Node node) {
  String output = convertNodesToCode(node);
  return Output(hasError: false, output: output);
}

Output evaluateGraph(List<Node> _nodes, int noOfNodes) {
  List<String> output;

  for (var i = 0; i < noOfNodes; i++) {
    output.add(convertNodesToCode(_nodes[i]) + '\n');
  }
  return Output();
}

String convertNodesToCode(Node node) {
  if (node.type == NodeType.Add) {
    return (double.parse(node.input['First']) +
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.Subtract) {
    return (double.parse(node.input['First']) -
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.Multiply) {
    return (double.parse(node.input['First']) *
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.DivideFull) {
    return (double.parse(node.input['First']) /
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.DivideQuestion) {
    return (double.parse(node.input['First']) ~/
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.DivideRemainder) {
    return (double.parse(node.input['First']) %
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.Not) {
    return (node.input['First'].toLowerCase() != 'true').toString();
  } else if (node.type == NodeType.Increment) {
    double _ = double.parse(node.input['First']);
    return (_++).toString();
  } else if (node.type == NodeType.Decrement) {
    double _ = double.parse(node.input['First']);
    return (_--).toString();
  } else if (node.type == NodeType.GreaterThan) {
    return (double.parse(node.input['First']) >
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.GreaterThanOrEqualTo) {
    return (double.parse(node.input['First']) >=
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.LessThan) {
    return (double.parse(node.input['First']) <
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.LessThanOrEqualTo) {
    return (double.parse(node.input['First']) <=
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.Equality) {
    return (double.parse(node.input['First']) ==
            double.parse(node.input['Second']))
        .toString();
  } else if (node.type == NodeType.NotEqual) {
    return (double.parse(node.input['First']) !=
            double.parse(node.input['Second']))
        .toString();
  }
  return '';
}
