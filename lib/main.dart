import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = 'Whackamole';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(28, (index) {
            return Center(
              child: StatefulMoleWidget(),
            );
          }),
        ),
      ),
    );
  }
}

class StatefulMoleWidget extends StatefulWidget {
  StatefulMoleWidget({Key key}) : super(key: key);

  @override
  _StatefulMoleWidget createState() => _StatefulMoleWidget();
}

class _StatefulMoleWidget extends State<StatefulMoleWidget> {

  Color _iconColor = Colors.green;
  bool _show = _randomizeShow();

  Widget build(BuildContext context) {
    return Container(
      child: Opacity(opacity: determineOpacity(_show),
          child: new IconButton(
            icon: Icon(
              Icons.android,
              color: _iconColor,
              size: 50.0,
            ),
            onPressed: () {
              setState(() {
                if(_show){
                  determineOpacity(_show);
                  _show = false;
                }else{
                  determineOpacity(_show);
                  _show = true;
                }
              });
            },
          )
      )
    );
  }


}


bool _randomizeShow(){
  final random = Random();
  return random.nextBool();
}

double determineOpacity(bool _show) {
  double opacityVal = 0.0;
  if(_show){
    opacityVal = 1.0;
  }else{
    opacityVal = 0.0;
  }
  return opacityVal;
}




