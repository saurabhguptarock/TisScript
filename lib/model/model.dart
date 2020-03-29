import 'package:flutter/material.dart';
import 'package:tis_script/shared/shared.dart';

class Node {
  final String name;
  final NodeType type;
  final int noOfInputs;
  final int noOfOutputs;
  final int height;
  final int width;
  final Color titleColor;
  final Map<String, String> input;
  final Map<String, String> output;

  Node({
    this.name,
    this.type,
    this.noOfInputs,
    this.noOfOutputs,
    this.height,
    this.width,
    this.titleColor,
    this.input,
    this.output,
  });

  Widget toWidget({double offsetX, double offsetY}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            color: Color(0xff403F40),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                width: 150,
                height: 20,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Text(this.name),
                  ],
                ),
              ).showDragOnHover,
            ],
          ),
        ),
      ),
    );
  }
}

enum NodeType {
  Math,
  String,
}

class Output {
  final bool hasError;
  final String output;

  Output({this.hasError, this.output});
}
