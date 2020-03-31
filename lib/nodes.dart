import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tis_script/model/model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as color;
import 'package:tis_script/shared/shared.dart';

Map<NodeCategory, Color> nodeColor = {
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

List<Node> availableNodes = [
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
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.NotBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];

  @override
  Widget toWidget({double offsetX, double offsetY, BuildContext context}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: GestureDetector(
        onDoubleTap: () {
          Output output = evaluateNode(this);
          if (!output.hasError)
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xff1E1F1C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1F1C),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      '${output.output}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
          else
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xffd8000c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xffd8000c),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      'Some error Occured',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
        },
        child: Card(
          elevation: 3,
          color: Color(0xff403F40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff403F40),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: titleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  width: width,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          FontAwesomeIcons.slidersH,
                          color: Colors.black38,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          this.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                for (var i = 1; i <= noOfInputs; i++)
                  Positioned(
                    left: 3,
                    top: 30.0 * i + 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${input['First']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                for (var i = 1; i <= noOfOutputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    right: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${output['First']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.EqualityBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];

  @override
  Widget toWidget({double offsetX, double offsetY, BuildContext context}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: GestureDetector(
        onDoubleTap: () {
          Output output = evaluateNode(this);
          if (!output.hasError)
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xff1E1F1C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1F1C),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      '${output.output}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
          else
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xffd8000c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xffd8000c),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      'Some error Occured',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
        },
        child: Card(
          elevation: 3,
          color: Color(0xff403F40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff403F40),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: titleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  width: width,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          FontAwesomeIcons.slidersH,
                          color: Colors.black38,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          this.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                for (var i = 1; i <= noOfInputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    left: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          i == 1 ? "${input['First']}" : "${input['Second']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                for (var i = 1; i <= noOfOutputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    right: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          i == 1 ? "${output['First']}" : "${output['Second']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotEqualInt extends Node {
  @override
  String get name => 'Not Equal (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

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
  NodeCategory get category => NodeCategory.bool;

  @override
  NodeType get type => NodeType.NotEqualBool;

  @override
  Color get titleColor => nodeColor[NodeCategory.bool];

  @override
  Widget toWidget({double offsetX, double offsetY, BuildContext context}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: GestureDetector(
        onDoubleTap: () {
          Output output = evaluateNode(this);
          if (!output.hasError)
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xff1E1F1C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1F1C),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      '${output.output}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
          else
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xffd8000c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xffd8000c),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      'Some error Occured',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
        },
        child: Card(
          elevation: 3,
          color: Color(0xff403F40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff403F40),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: titleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  width: width,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          FontAwesomeIcons.slidersH,
                          color: Colors.black38,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          this.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                for (var i = 1; i <= noOfInputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    left: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          i == 1 ? "${input['First']}" : "${input['Second']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                for (var i = 1; i <= noOfOutputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    right: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          i == 1 ? "${output['First']}" : "${output['Second']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RandomIntInRange extends Node {
  @override
  String get name => 'Random In Range (int)';

  @override
  int get noOfInputs => 2;

  @override
  int get noOfOutputs => 1;

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
  NodeCategory get category => NodeCategory.Color;

  @override
  NodeType get type => NodeType.ColorPicker;

  @override
  Color get titleColor => nodeColor[NodeCategory.Color];

  @override
  Widget toWidget({double offsetX, double offsetY, BuildContext context}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: GestureDetector(
        onDoubleTap: () {
          Output output = evaluateNode(this);
          if (!output.hasError)
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xff1E1F1C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1F1C),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      '${output.output}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
          else
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Card(
                color: Color(0xffd8000c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xffd8000c),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      'Some error Occured',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
              target: Offset(MediaQuery.of(context).size.width - 100, 10),
            );
        },
        child: Card(
          elevation: 3,
          color: Color(0xff403F40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff403F40),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: titleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  width: width,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          FontAwesomeIcons.slidersH,
                          color: Colors.black38,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          this.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 10,
                  child: SizedBox(
                    height: 20,
                    width: width * .4,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: color.ColorPicker(
                                pickerColor: output['Output'] ?? Colors.white,
                                onColorChanged: (c) {
                                  output = c;
                                },
                                showLabel: true,
                                pickerAreaHeightPercent: 0.8,
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: output['Output'] ?? Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
                for (var i = 1; i <= noOfOutputs; i++)
                  Positioned(
                    top: 30.0 * i + 10,
                    right: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${output['First']}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Card(
                          elevation: 2,
                          color: Color(0xff403F40),
                          shape: CircleBorder(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Color(0xff403F40),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: titleColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
