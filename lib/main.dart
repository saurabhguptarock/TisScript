import 'dart:html';
import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';
import 'package:tis_script/shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'Tis Script',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double top = 0;
  double left = 0;
  List<Color> _hovercolor =
      List.generate(availableNodes.length, (index) => Colors.transparent);
  bool _showNodeMenu = false;
  Map<int, Node> _indexAndNode = {};
  int _noOfNodes = 0;
  int _currentSelectedNode;
  String _searchQuery = '';
  Offset _initialOffset;
  Offset _finalOffset;
  Offset _initialNodeOffset;
  Offset _finalNodeOffset;
  Offset tmpLocation;
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (event) {
        if (event.runtimeType == RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.controlLeft) {
            _focusNode.unfocus();
            print('z');
          } else if (event.logicalKey == LogicalKeyboardKey.delete) {
            _focusNode.unfocus();
            if (_currentSelectedNode != null) {
              _indexAndNode.remove(_currentSelectedNode);
              _noOfNodes--;
            }
          }
        }
      },
      child: GestureDetector(
        onSecondaryTapDown: (details) {
          if (!_showNodeMenu) {
            setState(() {
              top = details.globalPosition.dy;
              left = details.globalPosition.dx;
              _showNodeMenu = !_showNodeMenu;
            });
          } else if (_showNodeMenu) {
            if (!((details.globalPosition.dx - left) < 220 &&
                (details.globalPosition.dx - left) > 0 &&
                (details.globalPosition.dy - top) < 350 &&
                (details.globalPosition.dy - top) > 0)) {
              setState(() {
                top = details.globalPosition.dy;
                left = details.globalPosition.dx;
              });
            }
          }
        },
        onTapDown: (details) {
          if (!((details.globalPosition.dx - left) < 220 &&
              (details.globalPosition.dx - left) > 0 &&
              (details.globalPosition.dy - top) < 350 &&
              (details.globalPosition.dy - top) > 0))
            setState(() {
              _showNodeMenu = false;
            });
          setState(() {
            _currentSelectedNode = null;
          });
        },
        onPanDown: (details) {
          if (!((details.globalPosition.dx - left) < 220 &&
              (details.globalPosition.dx - left) > 0 &&
              (details.globalPosition.dy - top) < 350 &&
              (details.globalPosition.dy - top) > 0)) {
            setState(() {
              _showNodeMenu = false;
            });
          }
          setState(() {
            _initialOffset = details.globalPosition;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _initialOffset = null;
            _finalOffset = null;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _finalOffset = details.globalPosition;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.grey[850],
          body: Stack(
            children: <Widget>[
              CustomPaint(
                foregroundPainter: _initialOffset != null &&
                        _finalOffset != null
                    ? DottedLinePainter(
                        initialPosition: _initialOffset,
                        finalPosition: _finalOffset,
                      )
                    : _initialNodeOffset != null && _finalNodeOffset != null
                        ? NodeConnectLinePainter(
                            initialPosition: _initialNodeOffset,
                            finalPosition: _finalNodeOffset,
                            color:
                                _indexAndNode[_currentSelectedNode].titleColor)
                        : null,
                child: Stack(
                  children: <Widget>[
                    for (var i = 0; i < _noOfNodes; i++)
                      Positioned(
                        left: _indexAndNode[i].nodePosition.dx,
                        top: _indexAndNode[i].nodePosition.dy,
                        child: GestureDetector(
                          onDoubleTap: () {
                            Output output = evaluateNode(_indexAndNode[i]);
                            if (!output.hasError) {
                              setState(() {
                                _indexAndNode[i].output = output.output;
                              });
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
                                target: Offset(
                                    MediaQuery.of(context).size.width - 100,
                                    10),
                              );
                            } else
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
                                target: Offset(
                                    MediaQuery.of(context).size.width - 100,
                                    10),
                              );
                          },
                          onPanDown: (details) {
                            setState(() {
                              tmpLocation = details.globalPosition;
                            });
                            Offset offset = Offset(
                                _indexAndNode[i].nodePosition.dx +
                                    details.globalPosition.dx -
                                    tmpLocation.dx,
                                _indexAndNode[i].nodePosition.dy +
                                    details.globalPosition.dy -
                                    tmpLocation.dy);
                            setState(() {
                              _indexAndNode[i].nodePosition = offset;
                              tmpLocation = details.globalPosition;
                            });
                          },
                          onPanUpdate: (details) {
                            Offset offset = Offset(
                                _indexAndNode[i].nodePosition.dx +
                                    details.globalPosition.dx -
                                    tmpLocation.dx,
                                _indexAndNode[i].nodePosition.dy +
                                    details.globalPosition.dy -
                                    tmpLocation.dy);
                            setState(() {
                              _indexAndNode[i].nodePosition = offset;
                              tmpLocation = details.globalPosition;
                            });
                          },
                          onTap: () {
                            setState(() {
                              _currentSelectedNode = i;
                            });
                          },
                          child: Card(
                            elevation: 3,
                            color: Color(0xff403F40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: _indexAndNode[i].height,
                              width: _indexAndNode[i].width,
                              decoration: BoxDecoration(
                                color: Color(0xff403F40),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _indexAndNode[i].titleColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    width: _indexAndNode[i].width,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Icon(
                                            FontAwesomeIcons.slidersH,
                                            color: Colors.grey,
                                            size: 15,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Text(
                                            _indexAndNode[i].name,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  for (var j = 1;
                                      j <= _indexAndNode[i].noOfInputs;
                                      j++)
                                    Positioned(
                                      top: 30.0 * j + 10,
                                      left: 3,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                    child: GestureDetector(
                                                      onPanDown: (details) {
                                                        setState(() {
                                                          _currentSelectedNode =
                                                              i;
                                                          _initialNodeOffset =
                                                              details
                                                                  .globalPosition;
                                                        });
                                                      },
                                                      onPanEnd: (details) {
                                                        setState(() {
                                                          _initialNodeOffset =
                                                              null;
                                                          _finalNodeOffset =
                                                              null;
                                                        });
                                                      },
                                                      onPanUpdate: (details) {
                                                        setState(() {
                                                          _finalNodeOffset =
                                                              details
                                                                  .globalPosition;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              _indexAndNode[i]
                                                                  .titleColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          InkWell(
                                            onDoubleTap: () {
                                              BotToast.showCustomNotification(
                                                duration: Duration(seconds: 10),
                                                align: Alignment.topCenter,
                                                toastBuilder: (s) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Card(
                                                    color: Color(0xff1E1F1C),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                    ),
                                                    child: Container(
                                                      height: 50,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color:
                                                            Color(0xff1E1F1C),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 7,
                                                                right: 10),
                                                        child: TextField(
                                                          autofocus: true,
                                                          autocorrect: true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          cursorColor:
                                                              Colors.white,
                                                          decoration: InputDecoration.collapsed(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintStyle: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white),
                                                              hintText:
                                                                  'Enter a ${_indexAndNode[i].category.toString().substring(13)}'),
                                                          onChanged: (s) {
                                                            if (j == 1) {
                                                              _indexAndNode[i]
                                                                      .input =
                                                                  Map.fromEntries([
                                                                MapEntry(
                                                                    'First', s),
                                                                MapEntry(
                                                                    'Second',
                                                                    _indexAndNode[i]
                                                                            .input[
                                                                        'Second']),
                                                              ]);
                                                              setState(() {});
                                                            } else {
                                                              _indexAndNode[i]
                                                                      .input =
                                                                  Map.fromEntries([
                                                                MapEntry(
                                                                    'First',
                                                                    _indexAndNode[i]
                                                                            .input[
                                                                        'First']),
                                                                MapEntry(
                                                                    'Second',
                                                                    s),
                                                              ]);
                                                              setState(() {});
                                                            }
                                                          },
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              j == 1
                                                  ? "${_indexAndNode[i].input['First']}"
                                                              .length <=
                                                          4
                                                      ? "${_indexAndNode[i].input['First']}"
                                                      : "${_indexAndNode[i].input['First'].substring(0, 4)}..."
                                                  : "${_indexAndNode[i].input['Second']}"
                                                              .length <=
                                                          4
                                                      ? "${_indexAndNode[i].input['Second']}"
                                                      : "${_indexAndNode[i].input['Second'].substring(0, 4)}...",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  for (var k = 1;
                                      k <= _indexAndNode[i].noOfOutputs;
                                      k++)
                                    Positioned(
                                      top: 30.0 * k + 10,
                                      right: 3,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${_indexAndNode[i].output['Output']}"
                                                        .length <=
                                                    4
                                                ? "${_indexAndNode[i].output['Output']}"
                                                : "${_indexAndNode[i].output['Output'].toString().substring(0, 4)}...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
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
                                              child: GestureDetector(
                                                onPanDown: (details) {
                                                  setState(() {
                                                    _currentSelectedNode = i;
                                                    _initialNodeOffset =
                                                        details.globalPosition;
                                                  });
                                                },
                                                onPanEnd: (details) {
                                                  setState(() {
                                                    _initialNodeOffset = null;
                                                    _finalNodeOffset = null;
                                                  });
                                                },
                                                onPanUpdate: (details) {
                                                  setState(() {
                                                    _finalNodeOffset =
                                                        details.globalPosition;
                                                  });
                                                },
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              _indexAndNode[i]
                                                                  .titleColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
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
                      ),
                  ],
                ),
              ),
              if (_showNodeMenu)
                Positioned(
                  left: left,
                  top: top,
                  child: Container(
                    height: 350,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Color(0xff232323).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.white,
                                decoration: InputDecoration.collapsed(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    hintText: 'Search...'),
                                onChanged: (s) {
                                  setState(() {
                                    _searchQuery = s;
                                  });
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
                          ],
                        ),
                        SizedBox(
                          height: 302,
                          child: ListView.builder(
                            itemCount: availableNodes.length,
                            itemBuilder: (ctx, i) => availableNodes[i]
                                    .name
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase())
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showNodeMenu = !_showNodeMenu;
                                        _indexAndNode[_noOfNodes] =
                                            availableNodes[i]
                                              ..nodePosition =
                                                  Offset(left, top);
                                        _noOfNodes++;
                                        _hovercolor[i] = Colors.transparent;
                                      });
                                    },
                                    child: MouseRegion(
                                      onHover: (details) {
                                        setState(() {
                                          _hovercolor[i] = Color(0xff4E76B7);
                                        });
                                      },
                                      onExit: (details) {
                                        setState(() {
                                          _hovercolor[i] = Colors.transparent;
                                        });
                                      },
                                      child: Container(
                                        color: _hovercolor[i],
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          availableNodes[i].name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              //  if(_showInputDialog)
              Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  'TIS SCRIPT',
                  style: TextStyle(color: Colors.white, fontSize: 55),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  Offset initialPosition;
  Offset finalPosition;
  DottedLinePainter({Offset initialPosition, Offset finalPosition}) {
    this.initialPosition = initialPosition;
    this.finalPosition = finalPosition;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 1;
    canvas.drawPoints(
        PointMode.polygon,
        [
          Offset(initialPosition.dx, initialPosition.dy),
          Offset(finalPosition.dx, initialPosition.dy),
          Offset(finalPosition.dx, finalPosition.dy),
          Offset(initialPosition.dx, finalPosition.dy),
          Offset(initialPosition.dx, initialPosition.dy),
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class NodeConnectLinePainter extends CustomPainter {
  Offset initialPosition;
  Offset finalPosition;
  Color color;
  NodeConnectLinePainter(
      {Offset initialPosition, Offset finalPosition, Color color}) {
    this.initialPosition = initialPosition;
    this.finalPosition = finalPosition;
    this.color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 3;
    canvas.drawLine(initialPosition, finalPosition, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
