import 'package:flutter/material.dart';
import 'package:tis_script/model/model.dart';

final Map<NodeCategory, Color> nodeColor = {
  NodeCategory.int: Color(0xff1DDCA9),
  NodeCategory.double: Color(0xff9CF742),
  NodeCategory.bool: Color(0xff8C0000),
  NodeCategory.String: Color(0xffF800CF),
  NodeCategory.Color: Color(0xff0056C7),
};

enum NodeCategory {
  int,
  double,
  bool,
  String,
  Color,
}

enum NodeType {
  // * Zero Input One Output
  RandomBool,
  ColorPicker,
  // * One Input One Output
  NotBool,
  IncrementInt,
  DecrementInt,
  IncrementDouble,
  DecrementDouble,
  // * Two Input Two Output
  AddInt,
  AddDouble,
  AddString,
  SubtractInt,
  SubtractDouble,
  MultiplyInt,
  MultiplyDouble,
  DivideFullInt,
  DivideQuestionInt,
  DivideRemainderInt,
  DivideFullDouble,
  DivideQuestionDouble,
  DivideRemainderDouble,
  GreaterThanInt,
  GreaterThanDouble,
  GreaterThanOrEqualToInt,
  GreaterThanOrEqualToDouble,
  LessThanInt,
  LessThanDouble,
  LessThanOrEqualToInt,
  LessThanOrEqualToDouble,
  EqualityInt,
  EqualityDouble,
  EqualityString,
  EqualityBool,
  NotEqualInt,
  NotEqualDouble,
  NotEqualBool,
  NotEqualString,
  RandomIntInRange,
  RandomDoubleInRange,
  None,
}

final List<Node> availableNodes = [
  // * Zero Input One Output
  RandomBool(),
  ColorPicker(),
  // * One Input One Output
  NotBool(),
  IncrementInt(),
  DecrementInt(),
  IncrementDouble(),
  DecrementDouble(),
  // * Two Input Two Output
  AddInt(),
  AddDouble(),
  AddString(),
  SubtractInt(),
  SubtractDouble(),
  MultiplyInt(),
  MultiplyDouble(),
  DivideFullInt(),
  DivideQuestionInt(),
  DivideRemainderInt(),
  DivideFullDouble(),
  DivideQuestionDouble(),
  DivideRemainderDouble(),
  GreaterThanInt(),
  GreaterThanDouble(),
  GreaterThanOrEqualToInt(),
  GreaterThanOrEqualToDouble(),
  LessThanInt(),
  LessThanDouble(),
  LessThanOrEqualToInt(),
  LessThanOrEqualToDouble(),
  EqualityInt(),
  EqualityDouble(),
  EqualityString(),
  EqualityBool(),
  NotEqualInt(),
  NotEqualDouble(),
  NotEqualBool(),
  NotEqualString(),
  RandomIntInRange(),
  RandomDoubleInRange(),
];

class AddInt extends Node {
  @override
  String get name => 'Add (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Add two int';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.AddInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class AddDouble extends Node {
  @override
  String get name => 'Add (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Add two double';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.AddDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class AddString extends Node {
  @override
  String get name => 'Add (String)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Add two String';

  @override
  NodeCategory get category => NodeCategory.String;

  @override
  NodeType get type => NodeType.AddString;

  @override
  Color get titleColor => nodeColor[NodeCategory.String];
}

class SubtractInt extends Node {
  @override
  String get name => 'Subtract (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Subtract two int';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.SubtractInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class SubtractDouble extends Node {
  @override
  String get name => 'Subtract (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Subtract two double';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.SubtractDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class MultiplyInt extends Node {
  @override
  String get name => 'Multiply (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Multiply two int';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.MultiplyInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class MultiplyDouble extends Node {
  @override
  String get name => 'Multiply (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Multiply two double';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.MultiplyDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class DivideFullInt extends Node {
  @override
  String get name => 'Divide Full (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two int with decimal';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.DivideFullInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class DivideFullDouble extends Node {
  @override
  String get name => 'Divide Full (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two double with decimal';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.DivideFullDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class DivideQuestionInt extends Node {
  @override
  String get name => 'Divide Question (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two int return question';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.DivideQuestionInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class DivideQuestionDouble extends Node {
  @override
  String get name => 'Divide Question (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two double return question';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.DivideQuestionDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class DivideRemainderInt extends Node {
  @override
  String get name => 'Divide Remainder (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two int return remainder';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.DivideRemainderInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class DivideRemainderDouble extends Node {
  @override
  String get name => 'Divide Remainder (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Divide two double return remainder';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.DivideRemainderDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class NotBool extends Node {
  @override
  String get name => 'Not (bool)';

  @override
  int get noOfInputs => 1;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Return not of a bool';

  @override
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.NotBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];
}

class IncrementInt extends Node {
  @override
  String get name => 'Increment (int)';

  @override
  int get noOfInputs => 1;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Increments int by 1';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.IncrementInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class IncrementDouble extends Node {
  @override
  String get name => 'Increment (double)';

  @override
  int get noOfInputs => 1;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Increments double by 1';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.IncrementDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class DecrementInt extends Node {
  @override
  String get name => 'Decrement (int)';

  @override
  int get noOfInputs => 1;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Decrements int by 1';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.DecrementInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class DecrementDouble extends Node {
  @override
  String get name => 'Decrement (double)';

  @override
  int get noOfInputs => 1;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Decrements double by 1';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.DecrementDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class GreaterThanInt extends Node {
  @override
  String get name => 'Greater Than (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if one int is greater than another';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.GreaterThanInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class GreaterThanDouble extends Node {
  @override
  String get name => 'Greater Than (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if one double is greater than another';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.GreaterThanDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class GreaterThanOrEqualToInt extends Node {
  @override
  String get name => 'Greater Than Or Equal To (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description =>
      'Check if one int is greater than or equal to another';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.GreaterThanOrEqualToInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class GreaterThanOrEqualToDouble extends Node {
  @override
  String get name => 'Greater Than Or Equal To (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description =>
      'Check if one double is greater than or equal to another';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.GreaterThanOrEqualToDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class LessThanInt extends Node {
  @override
  String get name => 'Less Than (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if one int is less than another';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.LessThanInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class LessThanDouble extends Node {
  @override
  String get name => 'Less Than (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if one double is less than another';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.LessThanDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class LessThanOrEqualToInt extends Node {
  @override
  String get name => 'Less Than Or Equal To (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if one int is less than or equal to another';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.LessThanOrEqualToInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class LessThanOrEqualToDouble extends Node {
  @override
  String get name => 'Less Than Or Equal To (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description =>
      'Check if one double is less than or equal to another';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.LessThanOrEqualToDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class EqualityInt extends Node {
  @override
  String get name => 'Equality (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two int are equal';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.EqualityInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class EqualityDouble extends Node {
  @override
  String get name => 'Equality (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two double are equal';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.EqualityDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class EqualityString extends Node {
  @override
  String get name => 'Equality (String)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two String are equal';

  @override
  NodeCategory get category => NodeCategory.String;

  @override
  NodeType get type => NodeType.EqualityString;

  @override
  Color get titleColor => nodeColor[NodeCategory.String];
}

class EqualityBool extends Node {
  @override
  String get name => 'Equality (bool)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two bool are equal';

  @override
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.EqualityBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];
}

class NotEqualInt extends Node {
  @override
  String get name => 'Not Equal (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two int are not equal';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.NotEqualInt;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class NotEqualDouble extends Node {
  @override
  String get name => 'Not Equal (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two double are not equal';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.NotEqualDouble;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class NotEqualString extends Node {
  @override
  String get name => 'Not Equal (string)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two String are not equal';

  @override
  NodeCategory get category => NodeCategory.String;

  @override
  NodeType get type => NodeType.NotEqualString;

  @override
  Color get titleColor => nodeColor[NodeCategory.String];
}

class NotEqualBool extends Node {
  @override
  String get name => 'Not Equal (bool)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Check if two bool are not equal';

  @override
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.NotEqualBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];
}

class RandomIntInRange extends Node {
  @override
  String get name => 'Random In Range (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Generates random int in range';

  @override
  NodeCategory get category => NodeCategory.int;

  @override
  NodeType get type => NodeType.RandomIntInRange;

  @override
  Color get titleColor => nodeColor[NodeCategory.int];
}

class RandomDoubleInRange extends Node {
  @override
  String get name => 'Random In Range (double)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

  @override
  String get description => 'Generates random double in range';

  @override
  NodeCategory get category => NodeCategory.double;

  @override
  NodeType get type => NodeType.RandomDoubleInRange;

  @override
  Color get titleColor => nodeColor[NodeCategory.double];
}

class RandomBool extends Node {
  @override
  String get name => 'Random (bool)';

  @override
  int get noOfInputs => 0;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Generates random bool';

  @override
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.RandomBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];
}

class ColorPicker extends Node {
  @override
  String get name => 'Color Picker';

  @override
  int get noOfInputs => 0;

  @override
  int get noOfOutputs => 1;

  @override
  double get height => 80;

  @override
  String get description => 'Pick a color from color pallet';

  @override
  NodeCategory get category => NodeCategory.Color;

  @override
  NodeType get type => NodeType.ColorPicker;

  @override
  Color get titleColor => nodeColor[NodeCategory.Color];
}
