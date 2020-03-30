import 'dart:math';
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';

Output evaluateNode(Node node) {
  String output = convertNodesToCode(node);
  return Output(hasError: false, output: output);
}

Output evaluateGraph(List<Node> _nodes, int noOfNodes) {
  List<String> output;

  for (var i = 0; i < noOfNodes; i++) {
    output.add(convertNodesToCode(_nodes[i]).toString() + '\n');
  }
  return Output();
}

dynamic convertNodesToCode(Node node) {
  // ! Input bool
  if (node.category == NodeCategory.bool) {
    if (node.type == NodeType.EqualityBool) {
      return node.input['First'] == node.input['Second'];
    } else if (node.type == NodeType.NotEqualBool) {
      return node.input['First'] != node.input['Second'];
    } else if (node.type == NodeType.NotBool) {
      return !node.input['First'];
    } else if (node.type == NodeType.RandomBool) {
      return Random().nextBool();
    }
  }
  // ! Input int
  else if (node.category == NodeCategory.int) {
    if (node.type == NodeType.IncrementInt) {
      return node.input['First']++;
    } else if (node.type == NodeType.AddInt) {
      return node.input['First'] + node.input['Second'];
    } else if (node.type == NodeType.DecrementInt) {
      return node.input['First']--;
    } else if (node.type == NodeType.DivideFullInt) {
      return node.input['First'] / node.input['Second'];
    } else if (node.type == NodeType.DivideQuestionInt) {
      return node.input['First'] ~/ node.input['Second'];
    } else if (node.type == NodeType.DivideRemainderInt) {
      return node.input['First'] % node.input['Second'];
    } else if (node.type == NodeType.EqualityInt) {
      return node.input['First'] == node.input['Second'];
    } else if (node.type == NodeType.GreaterThanInt) {
      return node.input['First'] > node.input['Second'];
    } else if (node.type == NodeType.GreaterThanOrEqualToInt) {
      return node.input['First'] >= node.input['Second'];
    } else if (node.type == NodeType.LessThanInt) {
      return node.input['First'] < node.input['Second'];
    } else if (node.type == NodeType.LessThanOrEqualToInt) {
      return node.input['First'] <= node.input['Second'];
    } else if (node.type == NodeType.MultiplyInt) {
      return node.input['First'] * node.input['Second'];
    } else if (node.type == NodeType.NotEqualInt) {
      return node.input['First'] != node.input['Second'];
    } else if (node.type == NodeType.RandomIntInRange) {
      return Random().nextInt(node.input['Second']) + node.input['First'];
    } else if (node.type == NodeType.SubtractInt) {
      return node.input['First'] - node.input['Second'];
    }
  }
  // ! Input double
  else if (node.category == NodeCategory.double) {
    if (node.type == NodeType.IncrementDouble) {
      return node.input['First']++;
    } else if (node.type == NodeType.AddDouble) {
      return node.input['First'] + node.input['Second'];
    } else if (node.type == NodeType.DecrementDouble) {
      return node.input['First']--;
    } else if (node.type == NodeType.DivideFullDouble) {
      return node.input['First'] / node.input['Second'];
    } else if (node.type == NodeType.DivideQuestionDouble) {
      return node.input['First'] ~/ node.input['Second'];
    } else if (node.type == NodeType.DivideRemainderDouble) {
      return node.input['First'] % node.input['Second'];
    } else if (node.type == NodeType.EqualityDouble) {
      return node.input['First'] == node.input['Second'];
    } else if (node.type == NodeType.GreaterThanDouble) {
      return node.input['First'] > node.input['Second'];
    } else if (node.type == NodeType.GreaterThanOrEqualToDouble) {
      return node.input['First'] >= node.input['Second'];
    } else if (node.type == NodeType.LessThanDouble) {
      return node.input['First'] < node.input['Second'];
    } else if (node.type == NodeType.LessThanOrEqualToDouble) {
      return node.input['First'] <= node.input['Second'];
    } else if (node.type == NodeType.MultiplyDouble) {
      return node.input['First'] * node.input['Second'];
    } else if (node.type == NodeType.NotEqualDouble) {
      return node.input['First'] != node.input['Second'];
    } else if (node.type == NodeType.RandomDoubleInRange) {
      return Random().nextDouble() * node.input['Second'] + node.input['First'];
    } else if (node.type == NodeType.SubtractDouble) {
      return node.input['First'] - node.input['Second'];
    }
  }
  // ! Input String
  else if (node.category == NodeCategory.String) {
    if (node.type == NodeType.AddString) {
      return node.input['First'] + node.input['Second'];
    } else if (node.type == NodeType.EqualityString) {
      return node.input['First'] == node.input['Second'];
    } else if (node.type == NodeType.NotEqualString) {
      return node.input['First'] != node.input['Second'];
    }
  }
  // ! Input Color
  else if (node.category == NodeCategory.Color) {
    if (node.type == NodeType.ColorPicker) {
      return node.input['First'];
    }
  }
}
