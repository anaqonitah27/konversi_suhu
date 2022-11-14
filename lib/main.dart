import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = (4 * inputUser) / 5;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Converter"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputsuhu(etInput: etInput),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Suhu dalam Kelvin",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$kelvin',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Suhu dalam Reamur",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$reamur',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: konversi,
                  child: const Text(
                    "Konversi",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class inputsuhu extends StatelessWidget {
  const inputsuhu({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Nilai Suhu"),
      //untuk membuat tipe keyboard yang angka saja
      keyboardType: TextInputType.number,
      //untuk memasukkan digit saja
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
    );
  }
}
