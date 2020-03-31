import 'dart:math';
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';

Output evaluateNode(Node node) {
  return _convertNodesToCode(node);
}

Output evaluateGraph(List<Node> _nodes, int noOfNodes) {
  List<Output> output;

  for (var i = 0; i < noOfNodes; i++) {
    output.add(_convertNodesToCode(_nodes[i]));
  }
  return Output();
}

Output _convertNodesToCode(Node node) {
  // ! Input bool
  if (node.category == NodeCategory.bool) {
    if (node.type == NodeType.EqualityBool) {
      bool first = node.input['First'];
      bool second = node.input['Second'];
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first == second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.NotEqualBool) {
      bool first = node.input['First'];
      bool second = node.input['Second'];
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first != second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.NotBool) {
      bool first = node.input['First'];
      if (first != null)
        return Output(
            hasError: false, output: !first, outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.RandomBool) {
      node.output = Random().nextBool();
      return Output(
          hasError: false,
          output: node.output['Output'],
          outputType: NodeCategory.int);
    }
  }
  // ! Input int
  else if (node.category == NodeCategory.int) {
    if (node.type == NodeType.IncrementInt) {
      int first = int.tryParse(node.input['First']);
      if (first != null)
        return Output(
            hasError: false, output: ++first, outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.AddInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first + second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DecrementInt) {
      int first = int.tryParse(node.input['First']);
      if (first != null)
        return Output(
            hasError: false, output: --first, outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideFullInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first / second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideQuestionInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first ~/ second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideRemainderInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first % second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.EqualityInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first == second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.GreaterThanInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first > second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.GreaterThanOrEqualToInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first >= second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.LessThanInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first < second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.LessThanOrEqualToInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first <= second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.MultiplyInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first * second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.NotEqualInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first != second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.RandomIntInRange) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: Random().nextInt(second) + first,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.SubtractInt) {
      int first = int.tryParse(node.input['First']);
      int second = int.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first - second,
            outputType: NodeCategory.int);
      else
        return Output(hasError: true, output: null, outputType: null);
    }
  }
  // ! Input double
  else if (node.category == NodeCategory.double) {
    if (node.type == NodeType.IncrementDouble) {
      double first = double.tryParse(node.input['First']);
      if (first != null)
        return Output(
            hasError: false, output: ++first, outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.AddDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first + second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DecrementDouble) {
      double first = double.tryParse(node.input['First']);
      if (first != null)
        return Output(
            hasError: false, output: --first, outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideFullDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first / second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideQuestionDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first ~/ second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.DivideRemainderDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first % second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.EqualityDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first == second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.GreaterThanDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first > second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.GreaterThanOrEqualToDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first >= second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.LessThanDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first < second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.LessThanOrEqualToDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first <= second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.MultiplyDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first * second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.NotEqualDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first != second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.RandomDoubleInRange) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: Random().nextDouble() * second + first,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.SubtractDouble) {
      double first = double.tryParse(node.input['First']);
      double second = double.tryParse(node.input['Second']);
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first - second,
            outputType: NodeCategory.double);
      else
        return Output(hasError: true, output: null, outputType: null);
    }
  }
  // ! Input String
  else if (node.category == NodeCategory.String) {
    if (node.type == NodeType.AddString) {
      String first = node.input['First'];
      String second = node.input['Second'];
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first + second,
            outputType: NodeCategory.String);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.EqualityString) {
      String first = node.input['First'];
      String second = node.input['Second'];
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first == second,
            outputType: NodeCategory.String);
      else
        return Output(hasError: true, output: null, outputType: null);
    } else if (node.type == NodeType.NotEqualString) {
      String first = node.input['First'];
      String second = node.input['Second'];
      if (first != null && second != null)
        return Output(
            hasError: false,
            output: first != second,
            outputType: NodeCategory.String);
      else
        return Output(hasError: true, output: null, outputType: null);
    }
  }
  // ! Input Color
  else if (node.category == NodeCategory.Color) {
    if (node.type == NodeType.ColorPicker) {
      return Output(
          hasError: false,
          output: node.output['Output'],
          outputType: NodeCategory.String);
    }
  }
}
