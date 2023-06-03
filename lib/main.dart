import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

/// Abstract Class: Class Animal dideklarasikan sebagai kelas abstract dengan adanya keyword "abstract"
/// Memiliki method abstrak "info()" yang harus diimplementasikan oleh kelas turunannya
abstract class Animal {
  String info();
}

/// Inheritance : Class Sapi mewarisi dari kelas Animal, yang membuat mereka turunan dari kelas Animal
class Sapi extends Animal {
  @override
  String info() {
    return "Jenis : Sapi Brahman\nJumlah : 2\n\nSapi brahman cocok untuk dikembangkan di daerah yang memiliki iklim tropis. Berat maksimum dari sapi brahman jantan hingga sekitar 800 kilogram, sedangkan dari sapi brahman betina hingga sekitar 500 kilogram.";
  }
}

/// Inheritance : Class Kambing mewarisi dari kelas Animal, yang membuat mereka turunan dari kelas Animal
class Kambing extends Animal {
  @override
  String info() {
    return "Jenis : Kambing Etawa\nJumlah : 5\n\nJenis kambing ini memiliki ciri khas kakinya yang pendek. Meski demikian, tubuhnya cukup besar. Beratnya bisa mencapai 63 kg untuk kambing betina dan 91 kg untuk kambing jantan.";
  }
}

/// Inheritance : Class Ayam mewarisi dari kelas Animal, yang membuat mereka turunan dari kelas Animal
class Ayam extends Animal {
  @override
  String info() {
    return "Jenis : Ayam Brahma\nJumlah : 5\n\nAyam Brahma adalah spesies ayam terbesar di dunia. Tinggi ayam ini bisa mencapai hingga 1 meter yaitu 76 cm. Beratnya berkisar antara 5,4 sampai 6,8 kilogram. Ayam Brahma merupakan spesies ayam yang berasal dari Sanghai.";
  }
}

/// Inheritance : Class Kelinci mewarisi dari kelas Animal, yang membuat mereka turunan dari kelas Animal
class Kelinci extends Animal {
  @override
  String info() {
    return "Jenis : Kelinci Anggora\nJumlah : 5\n\nkelinci ini memiliki bulu yang lebat dan panjang. Berat kelinci ini sekitar 2-4 kg. Bulu kelinci anggora dapat tumbuh sekitar 2 cm tiap bulan. Selain sebagai kelinci hias, bulu dari tipe Anggora ini sering digunakan sebagai wool.";
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/// Encapsulation : Properti yang digunakan disini sebagian besar di deklarasikan dengan private
class _MyAppState extends State<MyApp> {
  List<Animal> animals = [Sapi(), Kambing(), Ayam(), Kelinci()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Peternakan Mas Nugroho"),
        backgroundColor: Colors.brown[800],
      ),
      backgroundColor: Colors.brown[100],
      body: Container(
        padding: EdgeInsets.all(30.0),

        /// Polymorphism : pada saat membuat gridview, variable "animal" menjadi objek dari kelas turunan Animal (Sapi, Kambing, Ayam, Kelinci) yang di panggil dengan menggunakan method info() yang mengimplementasikan dari kelas abstrak Animal
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(animals.length, (index) {
            final animal = animals[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Text(animal.runtimeType.toString().split('.').last),
                        content: Text(animal.info()),
                        actions: <Widget>[
                          MaterialButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(animal.runtimeType.toString().split('.').last)
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
