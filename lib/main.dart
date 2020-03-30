import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:tis_script/nodes.dart';

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
    // throw UnimplementedError();
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
  List<Widget> _nodes = [];
  String _searchQuery = '';
  Offset _initialOffset;
  Offset _finalOffset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      },
      onPanStart: (details) {
        _initialOffset = details.globalPosition;
        setState(() {});
      },
      onPanEnd: (details) {
        _initialOffset = null;
        _finalOffset = null;
        setState(() {});
      },
      onPanUpdate: (details) {
        _finalOffset = details.globalPosition;
        setState(() {});
        // setState(() {
        //   offset[_nodes.length - 1] = Offset(
        //       offset[_nodes.length - 1].dx + details.delta.dx,
        //       offset[_nodes.length - 1].dy + details.delta.dy);
        // });
      },
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Stack(
          children: <Widget>[
            // TODO: Sugest better ways to show dotted line on top of nodes
            if (_initialOffset == null && _finalOffset == null)
              ..._nodes,
            if (_initialOffset != null && _finalOffset != null)
              CustomPaint(
                foregroundPainter: DottedLinePainter(
                  initialPosition: _initialOffset,
                  finalPosition: _finalOffset,
                ),
                child: Stack(
                  children: <Widget>[..._nodes],
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
                                    });
                                    _nodes.add(availableNodes[i].toWidget(
                                        offsetX: left,
                                        offsetY: top,
                                        context: context));
                                    _hovercolor[i] = Colors.transparent;
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
                                      width: MediaQuery.of(context).size.width,
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
          ],
        ),
      ),
    );
  }
}
