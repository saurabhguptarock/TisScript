import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:tis_script/shared/shared.dart';
import 'package:tis_script/nodes.dart';

class Node {
  final String name = 'Tis Script';
  final NodeCategory category = NodeCategory.String;
  final NodeType type = NodeType.None;
  final int noOfInputs = 0;
  final int noOfOutputs = 0;
  final double height = 100;
  final double width = 150;
  final Color titleColor = Colors.orange;
  final bool isContracted = false;
  Map<String, dynamic> inputLocal = {};
  Map<String, dynamic> outputLocal = {};

  set input(Map<String, dynamic> inp) {
    inputLocal = inp;
  }

  Map<String, dynamic> get input {
    return inputLocal;
  }

  set output(dynamic out) {
    outputLocal = Map.fromEntries([MapEntry('Output', out)]);
  }

  Map<String, dynamic> get output {
    return outputLocal;
  }

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
                ),
                for (var i = 1; i <= noOfInputs; i++) ...[
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
                          if (i == 1) {
                            input = Map.fromEntries([
                              MapEntry('First', s),
                              MapEntry('Second', input['Second'])
                            ]);
                          } else if (i == 2) {
                            input = Map.fromEntries([
                              MapEntry('First', input['First']),
                              MapEntry('Second', s)
                            ]);
                          }
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
                for (var i = 1; i <= noOfOutputs; i++) ...[
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

class Output {
  final bool hasError;
  final dynamic output;
  final NodeCategory outputType;

  Output({this.hasError, this.output, this.outputType});
}
