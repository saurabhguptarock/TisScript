import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tis_script/model/model.dart';
import 'package:tis_script/nodes.dart';
import 'package:tis_script/shared/shared.dart';
import 'package:recase/recase.dart';

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
            // TODO: Fix deleting node functionality.
            // if (_currentSelectedNode != null) {
            //   for (var i = _currentSelectedNode;
            //       i < _indexAndNode.length;
            //       i++) {
            //     if (_currentSelectedNode != null) {
            //       setState(() {
            //         _indexAndNode.remove(_currentSelectedNode);
            //         _currentSelectedNode = null;
            //       });
            //     }
            //   }
            //   _noOfNodes--;
            // }
          }
        }
      },
      child: GestureDetector(
        onSecondaryTapDown: (details) {
          if (!_showNodeMenu &&
              details.globalPosition.dx <
                  MediaQuery.of(context).size.width - 350) {
            setState(() {
              top = details.globalPosition.dy;
              left = details.globalPosition.dx;
              _showNodeMenu = !_showNodeMenu;
            });
          } else if (_showNodeMenu &&
              details.globalPosition.dx <
                  MediaQuery.of(context).size.width - 350) {
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
          if (_currentSelectedNode != null &&
              (details.globalPosition.dx <
                  MediaQuery.of(context).size.width - 350)) {
            setState(() {
              _currentSelectedNode = null;
            });
          }
          if (!((details.globalPosition.dx - left) < 220 &&
              (details.globalPosition.dx - left) > 0 &&
              (details.globalPosition.dy - top) < 350 &&
              (details.globalPosition.dy - top) > 0))
            setState(() {
              _showNodeMenu = false;
            });
        },
        onPanDown: (details) {
          if (details.globalPosition.dx <
              MediaQuery.of(context).size.width - 350) {
            setState(() {
              _initialOffset = details.globalPosition;
            });
          }
          if (!((details.globalPosition.dx - left) < 220 &&
              (details.globalPosition.dx - left) > 0 &&
              (details.globalPosition.dy - top) < 350 &&
              (details.globalPosition.dy - top) > 0)) {
            setState(() {
              _showNodeMenu = false;
            });
          }
        },
        onPanEnd: (details) {
          setState(() {
            _initialOffset = null;
            _finalOffset = null;
          });
        },
        onPanUpdate: (details) {
          if (details.globalPosition.dx <
              MediaQuery.of(context).size.width - 350) {
            setState(() {
              _finalOffset = details.globalPosition;
            });
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xff1F1E1F),
          body: Stack(
            children: <Widget>[
              CustomPaint(
                foregroundPainter: _initialOffset != null &&
                        _finalOffset != null
                    ? DottedLinePainter(
                        initialPosition: _initialOffset,
                        finalPosition: _finalOffset,
                      )
                    : _initialNodeOffset != null &&
                            _finalNodeOffset != null &&
                            _currentSelectedNode != null
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
                          onPanDown: (details) {
                            if (details.globalPosition.dx <
                                MediaQuery.of(context).size.width - 350) {
                              setState(() {
                                tmpLocation = details.globalPosition;
                                _currentSelectedNode = i;
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
                            }
                          },
                          onPanUpdate: (details) {
                            if (details.globalPosition.dx <
                                MediaQuery.of(context).size.width - 350) {
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
                            }
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
                              side: BorderSide(
                                width: _currentSelectedNode != null
                                    ? _currentSelectedNode == i ? 2 : 0
                                    : 0,
                                color: Colors.orange,
                              ),
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
                                                        if (details
                                                                .globalPosition
                                                                .dx <
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                350) {
                                                          setState(() {
                                                            _currentSelectedNode =
                                                                i;
                                                            _initialNodeOffset =
                                                                details
                                                                    .globalPosition;
                                                          });
                                                        }
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
                                                        if (details
                                                                .globalPosition
                                                                .dx <
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                350) {
                                                          setState(() {
                                                            _finalNodeOffset =
                                                                details
                                                                    .globalPosition;
                                                          });
                                                        }
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
                                                  if (details
                                                          .globalPosition.dx <
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          350) {
                                                    setState(() {
                                                      _currentSelectedNode = i;
                                                      _initialNodeOffset =
                                                          details
                                                              .globalPosition;
                                                    });
                                                  }
                                                },
                                                onPanEnd: (details) {
                                                  setState(() {
                                                    _initialNodeOffset = null;
                                                    _finalNodeOffset = null;
                                                  });
                                                },
                                                onPanUpdate: (details) {
                                                  if (details
                                                          .globalPosition.dx <
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          350) {
                                                    setState(() {
                                                      _finalNodeOffset = details
                                                          .globalPosition;
                                                    });
                                                  }
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
              Positioned(
                bottom: 10,
                right: 360,
                child: Text(
                  'TIS SCRIPT',
                  style: TextStyle(color: Colors.white, fontSize: 55),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Color(0xff282729),
                    width: 350,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 35,
                                    width: 70,
                                    child: RaisedButton(
                                      color: Color(0xff3C3C3C),
                                      disabledColor: Colors.grey[850],
                                      onPressed: _currentSelectedNode != null
                                          ? () {
                                              Output output = evaluateNode(
                                                  _indexAndNode[
                                                      _currentSelectedNode]);
                                              if (!output.hasError) {
                                                setState(() {
                                                  _indexAndNode[
                                                          _currentSelectedNode]
                                                      .output = output.output;
                                                });
                                                BotToast.showAttachedWidget(
                                                  attachedBuilder: (_) => Card(
                                                    color: Color(0xff1E1F1C),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                    child: Container(
                                                      height: 50,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff1E1F1C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${output.output}',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  duration:
                                                      Duration(seconds: 5),
                                                  target: Offset(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          100,
                                                      10),
                                                );
                                              } else
                                                BotToast.showAttachedWidget(
                                                  attachedBuilder: (_) => Card(
                                                    color: Color(0xffd8000c),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                    child: Container(
                                                      height: 50,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd8000c),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Some error Occured',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  duration:
                                                      Duration(seconds: 5),
                                                  target: Offset(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          100,
                                                      10),
                                                );
                                            }
                                          : null,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  SizedBox(
                                    height: 35,
                                    width: 70,
                                    child: RaisedButton(
                                      color: Color(0xff3C3C3C),
                                      disabledColor: Colors.grey[850],
                                      onPressed: _indexAndNode.length > 0
                                          ? () {}
                                          : null,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.scatter_plot,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 35,
                                    width: 70,
                                    child: RaisedButton(
                                      color: Color(0xff3C3C3C),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.format_size,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    height: 35,
                                    width: 70,
                                    child: RaisedButton(
                                      color: Color(0xff3C3C3C),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (_currentSelectedNode != null) ...[
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.black45,
                            thickness: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 20),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.slidersH,
                                  color: Colors.grey,
                                  size: 17,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  _indexAndNode[_currentSelectedNode]
                                      .category
                                      .toString()
                                      .substring(13)
                                      .titleCase,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    color: Color(0xff111111),
                                    width: 200,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: -10,
                                          left: 10,
                                          right: 10,
                                          child: TextFormField(
                                            initialValue:
                                                '${_indexAndNode[_currentSelectedNode].type.toString().substring(9).titleCase}',
                                            readOnly: !_indexAndNode[
                                                    _currentSelectedNode]
                                                .isEditable,
                                            cursorColor: Colors.white,
                                            decoration:
                                                InputDecoration.collapsed(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                    hintText: 'Enter a name'),
                                            onFieldSubmitted: (s) {
                                              // TODO: Update name
                                            },
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          for (var i = 1;
                              i <=
                                  _indexAndNode[_currentSelectedNode]
                                      .noOfInputs;
                              i++)
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Input $i',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      color: Color(0xff111111),
                                      width: 200,
                                      height: 30,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: -10,
                                            left: 10,
                                            right: 10,
                                            child: TextFormField(
                                              initialValue: i == 1
                                                  ? _indexAndNode[_currentSelectedNode]
                                                              .input['First']
                                                              .toString() ==
                                                          'null'
                                                      ? ''
                                                      : _indexAndNode[
                                                              _currentSelectedNode]
                                                          .input['First']
                                                          .toString()
                                                  : _indexAndNode[_currentSelectedNode]
                                                              .input['Second']
                                                              .toString() ==
                                                          'null'
                                                      ? ''
                                                      : _indexAndNode[
                                                              _currentSelectedNode]
                                                          .input['Second']
                                                          .toString(),
                                              cursorColor: Colors.white,
                                              decoration: InputDecoration.collapsed(
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      decoration:
                                                          TextDecoration.none),
                                                  hintText:
                                                      'Enter a ${_indexAndNode[_currentSelectedNode].category.toString().substring(13)}'),
                                              onFieldSubmitted: (s) {
                                                if (i == 1) {
                                                  _indexAndNode[
                                                          _currentSelectedNode]
                                                      .input = Map.fromEntries([
                                                    MapEntry('First', s),
                                                    MapEntry(
                                                        'Second',
                                                        _indexAndNode[
                                                                _currentSelectedNode]
                                                            .input['Second'])
                                                  ]);
                                                  setState(() {});
                                                } else {
                                                  _indexAndNode[
                                                          _currentSelectedNode]
                                                      .input = Map.fromEntries([
                                                    MapEntry(
                                                        'First',
                                                        _indexAndNode[
                                                                _currentSelectedNode]
                                                            .input['First']),
                                                    MapEntry('Second', s)
                                                  ]);
                                                  setState(() {});
                                                }
                                              },
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
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
