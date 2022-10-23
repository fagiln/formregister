import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List agama = <String>[
    "islam",
    "kristen protestan",
    "Kristen Katholik",
    "hindu",
    "Budha",
    "Konghucu"
  ];

  String agamaValue = "";

  String _nama = "islam";
  String _jenisKelamin = "";

  final cNama = TextEditingController();
  final cPass = TextEditingController();
  final cMoto = TextEditingController();

  void pilihJk(value) {
    setState(() {
      _jenisKelamin = value;
    });
  }

  void pilihAgama(value) {
    setState(() {
      agamaValue = value;
    });
  }

  void kirimData() {
    var alertDialog = AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Lengkap : ${cNama.text}"),
            Text("Password : ${cPass.text}"),
            Text("Moto : ${cMoto.text}"),
            Text("Jenis Kelamin : ${_jenisKelamin}"),
            Text("Agama : ${agamaValue}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"))
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Diri"),
        leading: Icon(Icons.list),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: cNama,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                hintText: "Masukan Nama Lengkap",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: cPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Masukan Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: cMoto,
              autocorrect: true,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: "Moto",
                  hintText: "Masukan moto hidup mu"),
            ),
            RadioListTile(
              title: Text("Laki laki"),
              value: "laki-laki",
              groupValue: _jenisKelamin,
              onChanged: (value) {
                pilihJk(value!);
              },
              activeColor: Colors.blue,
              subtitle: Text("Pilih ini jika anda laki laki"),
            ),
            RadioListTile(
              title: Text("perempuan"),
              value: "perempuan",
              groupValue: _jenisKelamin,
              onChanged: (value) {
                pilihJk(value!);
              },
              activeColor: Colors.blue,
              subtitle: Text("Pilih ini jika anda perempuan "),
            ),
            Row(
              children: [
                Text("Agama"),
                SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  hint: Text("Pilih agama"),
                  items: agama
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    pilihAgama(value!);
                  },
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                ),
                onPressed: () {
                  kirimData();
                },
                child: Text("Kirim data"))
          ],
        ),
      ),
    );
  }
}
