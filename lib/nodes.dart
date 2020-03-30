import 'package:flutter/material.dart';
import 'package:tis_script/model/model.dart';

enum NodeCategory {
  Math,
  Bool,
  String,
}

enum NodeType {
  // * One Input One Output
  Not,
  Increment,
  Decrement,
  // * Two Input Two Output
  Add,
  Subtract,
  Multiply,
  DivideFull,
  DivideQuestion,
  DivideRemainder,
  GreaterThan,
  GreaterThanOrEqualTo,
  LessThan,
  LessThanOrEqualTo,
  Equality,
  NotEqual,
  None,
}

List<Node> availableNodes = [
  // * One Input One Output
  Not(),
  Increment(),
  Decrement(),
  // * Two Input Two Output
  Add(),
  Subtract(),
  Multiply(),
  Divide(),
  DivideQuestion(),
  DivideRemainder(),
  GreaterThan(),
  GreaterThanOrEqualTo(),
  LessThan(),
  LessThanOrEqualTo(),
  Equality(),
  NotEqual(),
];

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

class Subtract extends Node {
  @override
  String get name => 'Subtract';

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
  NodeType get type => NodeType.Subtract;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class Multiply extends Node {
  @override
  String get name => 'Multiply';

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
  NodeType get type => NodeType.Multiply;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class Divide extends Node {
  @override
  String get name => 'Divide';

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
  NodeType get type => NodeType.DivideFull;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class DivideQuestion extends Node {
  @override
  String get name => 'Divide (Question)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 130;

  @override
  double get width => 180;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Math;

  @override
  NodeType get type => NodeType.DivideQuestion;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class DivideRemainder extends Node {
  @override
  String get name => 'Divide (Remainder)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 130;

  @override
  double get width => 180;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Math;

  @override
  NodeType get type => NodeType.DivideRemainder;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class Not extends Node {
  @override
  String get name => 'Not';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 90;

  @override
  double get width => 150;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.Not;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
      ]);
}

class Increment extends Node {
  @override
  String get name => 'Increment';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 90;

  @override
  double get width => 150;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Math;

  @override
  NodeType get type => NodeType.Increment;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
      ]);
}

class Decrement extends Node {
  @override
  String get name => 'Decrement';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 90;

  @override
  double get width => 150;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Math;

  @override
  NodeType get type => NodeType.Decrement;

  @override
  Color get titleColor => Colors.green;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
      ]);
}

class GreaterThan extends Node {
  @override
  String get name => 'GreaterThan';

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
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.GreaterThan;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class GreaterThanOrEqualTo extends Node {
  @override
  String get name => 'GreaterThanOrEqualTo';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 130;

  @override
  double get width => 220;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.GreaterThanOrEqualTo;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class LessThan extends Node {
  @override
  String get name => 'LessThan';

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
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.LessThan;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class LessThanOrEqualTo extends Node {
  @override
  String get name => 'LessThanOrEqualTo';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 130;

  @override
  double get width => 200;

  @override
  Map<String, String> get output => Map.fromEntries([MapEntry('Output', '')]);

  @override
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.LessThanOrEqualTo;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class Equality extends Node {
  @override
  String get name => 'Equality';

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
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.Equality;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}

class NotEqual extends Node {
  @override
  String get name => 'NotEqual';

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
  NodeCategory get category => NodeCategory.Bool;

  @override
  NodeType get type => NodeType.NotEqual;

  @override
  Color get titleColor => Colors.red;

  @override
  Map<String, String> get input => Map.fromEntries([
        MapEntry('First', ''),
        MapEntry('Second', ''),
      ]);
}
