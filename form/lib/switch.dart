import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class HalamanDua extends StatefulWidget {
  const HalamanDua({super.key});

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  double nilaiSlider = 1;
  bool nilaiChecker = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              CheckboxListTile(
                title: Text("Belajar dasar flutter"),
                subtitle: Text('Dart, Widget, http'),
                activeColor: Colors.green,
                value: nilaiChecker,
                onChanged: (value) {
                  setState(() {
                    nilaiChecker = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              SwitchListTile(
                title: Text('Backend Programing'),
                subtitle: Text('dart, nodeJs, php, dll'),
                activeColor: Colors.green,
                activeTrackColor: Colors.green[200],
                value: nilaiSwitch,
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  },);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Slider(
                value: nilaiSlider,
                thumbColor: Colors.green,
                activeColor: Colors.green[200],
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(
                    () {
                      nilaiSlider = value;
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
