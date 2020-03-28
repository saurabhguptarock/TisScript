import 'package:flutter/material.dart';
import 'package:tis_script/model/model.dart';
import 'shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tis Script',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
  List<Color> _hovercolor = List.generate(100, (index) => Colors.transparent);
  bool _showNodeMenu = false;
  List<Widget> _nodes = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (details) {
        // if (left - details.globalPosition.dx < 180 &&
        //     !_showNodeMenu &&
        //     top - details.globalPosition.dy < 300)
        setState(() {
          top = details.globalPosition.dy;
          left = details.globalPosition.dx;
          _showNodeMenu = !_showNodeMenu;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Stack(
          children: <Widget>[
            ..._nodes,
            if (_showNodeMenu)
              Positioned(
                left: left,
                top: top,
                child: Container(
                  height: 300,
                  width: 180,
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
                              autocorrect: true,
                              cursorColor: Color(0xff00887A),
                              decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  hintText: 'Search...'),
                              onChanged: (s) {},
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
                        ],
                      ),
                      SizedBox(
                        height: 252,
                        child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (ctx, i) => InkWell(
                            onTap: () {
                              setState(() {
                                _showNodeMenu = !_showNodeMenu;
                              });
                              _nodes.add(
                                Positioned(
                                  left: left,
                                  top: top,
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 20,
                                          child: Text('data'),
                                        ).showDragOnHover,
                                      ],
                                    ),
                                  ),
                                ),
                              );
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
                                  'data',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ).showPointerOnHover,
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
    );
  }
}
