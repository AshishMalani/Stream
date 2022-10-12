import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  bool isMale = false;

  void genderSwitchCallBack(bool value) {
    print(value);
    isMale = value;
  }

  @override
  Widget build(BuildContext context) {
    print("home build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("is Male?"),
              GenderSwitch(
                isMale: isMale,
                genderSwitchCallBack: genderSwitchCallBack,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(isMale);
        },
      ),
    );
  }
}

class GenderSwitch extends StatefulWidget {
  GenderSwitch(
      {Key? key, required this.isMale, required this.genderSwitchCallBack})
      : super(key: key);
  bool isMale;

  void Function(bool) genderSwitchCallBack;

  @override
  State<GenderSwitch> createState() => _GenderSwitchState();
}

class _GenderSwitchState extends State<GenderSwitch> {
  @override
  Widget build(BuildContext context) {
    print("GenderSwitch build");
    return Switch(
        value: widget.isMale,
        onChanged: (value) {
          setState(() {
            widget.isMale = value;
            widget.genderSwitchCallBack(value);
          });
        });
  }
}
