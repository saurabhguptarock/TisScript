import 'dart:math' as math;
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';

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
  return '';
}
