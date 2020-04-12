import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';
import 'package:universal_html/html.dart' as html;

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
      return Output(
          hasError: false,
          output: Random().nextBool(),
          outputType: NodeCategory.int);
    }
  }
  // ! Input int
  else if (node.category == NodeCategory.int) {
    if (node.type == NodeType.IncrementInt) {
      if (node.input['First'] == null || node.input['First'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        if (first != null)
          return Output(
              hasError: false, output: ++first, outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.AddInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first + second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.DecrementInt) {
      if (node.input['First'] == null || node.input['First'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        if (first != null)
          return Output(
              hasError: false, output: --first, outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.DivideFullInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first / second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.DivideQuestionInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first ~/ second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.DivideRemainderInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first % second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.EqualityInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first == second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.GreaterThanInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first > second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.GreaterThanOrEqualToInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first >= second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.LessThanInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first < second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.LessThanOrEqualToInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first <= second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.MultiplyInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first * second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.NotEqualInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first != second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.RandomIntInRange) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: Random().nextInt(second) + first,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    } else if (node.type == NodeType.SubtractInt) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        int first = int.tryParse(node.input['First']);
        int second = int.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first - second,
              outputType: NodeCategory.int);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter an int');
      }
    }
  }
  // ! Input double
  else if (node.category == NodeCategory.double) {
    if (node.type == NodeType.IncrementDouble) {
      if (node.input['First'] == null || node.input['First'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        if (first != null)
          return Output(
              hasError: false,
              output: ++first,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.AddDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first + second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.DecrementDouble) {
      if (node.input['First'] == null || node.input['First'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        if (first != null)
          return Output(
              hasError: false,
              output: --first,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.DivideFullDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first / second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.DivideQuestionDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first ~/ second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.DivideRemainderDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first % second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.EqualityDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first == second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.GreaterThanDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first > second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.GreaterThanOrEqualToDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first >= second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.LessThanDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first < second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.LessThanOrEqualToDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first <= second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.MultiplyDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first * second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.NotEqualDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first != second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.RandomDoubleInRange) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: Random().nextDouble() * second + first,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    } else if (node.type == NodeType.SubtractDouble) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        double first = double.tryParse(node.input['First']);
        double second = double.tryParse(node.input['Second']);
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first - second,
              outputType: NodeCategory.double);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a double');
      }
    }
  }
  // ! Input String
  else if (node.category == NodeCategory.String) {
    if (node.type == NodeType.AddString) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        String first = node.input['First'];
        String second = node.input['Second'];
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first + second,
              outputType: NodeCategory.String);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a string');
      }
    } else if (node.type == NodeType.EqualityString) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        String first = node.input['First'];
        String second = node.input['Second'];
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first == second,
              outputType: NodeCategory.String);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a string');
      }
    } else if (node.type == NodeType.NotEqualString) {
      if (node.input['First'] == null ||
          node.input['Second'] == null ||
          node.input['First'] == '' ||
          node.input['Second'] == '') {
        return Output(
            hasError: true,
            output: null,
            outputType: null,
            message: 'Input is empty');
      } else {
        String first = node.input['First'];
        String second = node.input['Second'];
        if (first != null && second != null)
          return Output(
              hasError: false,
              output: first != second,
              outputType: NodeCategory.String);
        else
          return Output(
              hasError: true,
              output: null,
              outputType: null,
              message: 'Enter a string');
      }
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
  return Output(
      hasError: true,
      output: null,
      outputType: null,
      message: 'Node not understandable');
}

class MoveCursor extends MouseRegion {
  static final appContainer =
      html.window.document.getElementById('app-container');

  MoveCursor({Widget child})
      : super(
            onHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'move';
            },
            onExit: (PointerExitEvent evt) {
              appContainer.style.cursor = 'default';
            },
            child: child);
}

class CrosshairCursor extends MouseRegion {
  static final appContainer =
      html.window.document.getElementById('app-container');

  CrosshairCursor({Widget child})
      : super(
            onHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'crosshair';
            },
            onExit: (PointerExitEvent evt) {
              appContainer.style.cursor = 'default';
            },
            child: child);
}

class DefaultCursor extends MouseRegion {
  static final appContainer =
      html.window.document.getElementById('app-container');

  DefaultCursor({Widget child})
      : super(
            onHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'default';
            },
            onExit: (PointerExitEvent evt) {
              appContainer.style.cursor = 'default';
            },
            child: child);
}
