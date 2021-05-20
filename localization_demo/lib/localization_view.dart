import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationView extends StatefulWidget {
  @override
  _LocalizationViewState createState() => _LocalizationViewState();
}

class _LocalizationViewState extends State<LocalizationView> {
  final TextStyle _style = TextStyle(
    color: Colors.blue[800],
    fontSize: 28,
  );

  List<bool> _isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  'text',
                  textAlign: TextAlign.center,
                  style: _style,
                ).tr(),
              ),
            ),
          ),
          ToggleButtons(
            textStyle: _style,
            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: 40,
            ),
            children: <Widget>[
              Text('en'),
              Text('es'),
              Text('hi'),
            ],
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                _isSelected = [false, false, false];
                _isSelected[index] = !_isSelected[index];
              });
              switch (index) {
                case 0:
                  context.setLocale(Locale('en'));
                  break;
                case 1:
                  context.setLocale(Locale('es'));
                  break;
                case 2:
                  context.setLocale(Locale('hi'));
                  break;
                default:
                  context.setLocale(Locale('en'));
              }
            },
          ),
        ],
      ),
    );
  }
}
