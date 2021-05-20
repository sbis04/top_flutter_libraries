import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/models/color.dart';
import 'package:random_color/random_color.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main.dart';

class ColorPage extends StatelessWidget {
  final _colorsBox = Hive.box('colors');

  final RandomColor _randomColor = RandomColor();

  CustomColor _generateColor() {
    Color _color = _randomColor.randomColor();
    MyColor _myColor = getColorNameFromColor(_color);

    final newColor = CustomColor(
      colorName: _myColor.getName,
      colorHex: '#${_color.value.toRadixString(16).substring(2)}',
    );
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: _colorsBox.listenable(),
              builder: (context, Box<dynamic> box, _) {
                return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final color = box.getAt(index) as CustomColor;
                    return ListTile(
                      leading: ClipOval(
                        child: Material(
                          color: Color(
                              int.parse('0xFF${color.colorHex.substring(1)}')),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.refresh),
                              onPressed: () {
                                CustomColor newColor = _generateColor();
                                box.putAt(index, newColor);
                              }),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                box.deleteAt(index);
                              }),
                        ],
                      ),
                      title: Text(color.colorName),
                      subtitle: Text(color.colorHex),
                    );
                  },
                );
              }),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            CustomColor newColor = _generateColor();

            _colorsBox.add(newColor);
          },
          child: text,
        ),
      ],
    );
  }
}
