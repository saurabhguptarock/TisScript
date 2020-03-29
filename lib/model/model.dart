import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:tis_script/shared/shared.dart';

class Node {
  final String name = 'Tis Script';
  final NodeCategory category = NodeCategory.String;
  final NodeType type = NodeType.None;
  final int noOfInputs = 0;
  final int noOfOutputs = 0;
  final double height = 100;
  final double width = 150;
  final Color titleColor = Colors.orange;
  Map<String, String> input = {};
  Map<String, String> output = {};
  final bool isContracted = false;

  Widget toWidget({double offsetX, double offsetY}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: GestureDetector(
        onDoubleTap: () {
          Output output = evaluateNode(this);
          BotToast.showText(text: output.output);
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
                  height: 20,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            isContracted
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          this.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ).showDragOnHover,
                for (var i = 1; i <= input.length; i++) ...[
                  Positioned(
                    left: 15,
                    top: 40.0 * i,
                    child: SizedBox(
                      height: 20,
                      width: width * .7,
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        decoration: InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: '0'),
                        onChanged: (s) {
                          input.update('First', (value) => value = s);
                        },
                        minLines: 1,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.0 * i + 19,
                    left: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
                for (var i = 1; i <= output.length; i++) ...[
                  Positioned(
                    right: 15,
                    top: 20.0 * i,
                    child: SizedBox(
                      height: 20,
                      width: width * .1,
                      child: TextField(
                        readOnly: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: '0'),
                        onChanged: (s) {
                          input.update('Second', (value) => value = s);
                        },
                        enableInteractiveSelection: true,
                        minLines: 1,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.0 * i + 19,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class Output {
  final bool hasError;
  final String output;

  Output({this.hasError, this.output});
}
