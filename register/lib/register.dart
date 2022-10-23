import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(register());
}

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  List<String> hakakses = ["Siswa", "Pengajar", "Teknisi", "Admin"];

  String _hakakses = "Siswa";
  String _jk = "";

  void _pilihJK(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihhakakses(String value) {
    setState(() {
      _hakakses = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIM ONLINE POLIJE"),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Registrasi',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'No HP',
              ),
            ),
          ),
          new RadioListTile(
            value: "Laki laki",
            title: new Text("Laki laki"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihJK(value!);
            },
            activeColor: Colors.deepPurple,
            subtitle: new Text("Pilih ini jika anda Laki-laki"),
          ),
          new RadioListTile(
            value: "Perempuan",
            title: new Text("Perempuan"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihJK(value!);
            },
            activeColor: Colors.deepPurple,
            subtitle: new Text("Pilih ini jika anda Perempuan"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Alamat',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(left: 15.0),
          ),
          new Row(
            children: <Widget>[
              new Text(
                "Hak akses",
                style: new TextStyle(fontSize: 18.0, color: Colors.deepPurple),
              ),
              DropdownButton(
                onChanged: (String? value) {
                  pilihhakakses(value!);
                },
                value: _hakakses,
                items: hakakses.map((String value) {
                  return new DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'created by Fagil Nuril Akbar',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              )),
        ],
      )),
    );
  }
}
