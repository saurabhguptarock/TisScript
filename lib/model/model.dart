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
  final List<String> inputNames;
  final List<String> outputNames;

  Node(
      {this.name,
      this.type,
      this.noOfInputs,
      this.noOfOutputs,
      this.height,
      this.width,
      this.titleColor,
      this.inputNames,
      this.outputNames});

  Widget toWidget({double offsetX, double offsetY, BuildContext context}) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xff403F40),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: 0.4,
          ),
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
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Text(this.name),
            ).showDragOnHover,
          ],
        ),
      ),
    );
  }
}

class NodeType {}
