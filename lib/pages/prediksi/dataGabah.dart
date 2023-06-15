import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Gabah {
  final int id;
  final String jenis;
  final String waktu;
  final String suhu1;
  final String kadar_air1;
  final String suhu2;
  final String kadar_air2;
  Gabah({required this.id, required this.jenis, required this.waktu,required this.suhu1,required this.kadar_air1, required this.suhu2,required this.kadar_air2});

  factory Gabah.fromJson(Map<String, dynamic> json) {
    return Gabah(
      id: json['id'],
      jenis: json['jenis'],
      waktu: json['waktu'],
      suhu1: json['suhu1'],
      kadar_air1: json['kadar_air1'],
      suhu2: json['suhu2'],
      kadar_air2: json['kadar_air2'],
    );
  }
}

class GabahScreen extends StatefulWidget {
  @override
  _GabahScreenState createState() => _GabahScreenState();
}

class _GabahScreenState extends State<GabahScreen> {
  List<Gabah> gabahData = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.141.93:5000/gabah'));
    if (response.statusCode == 200) {
      setState(() {
        final jsonData = json.decode(response.body);
        gabahData = List.from(jsonData['data']).map((data) => Gabah.fromJson(data)).toList();
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch data',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gabah Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            // DataColumn(label: Text('id')),
            DataColumn(label: Text('Jenis')),
            DataColumn(label: Text('Waktu Prediksi')),
            DataColumn(label: Text('Detail')),
          ],
          rows: gabahData.map((gabah) {
            return DataRow(cells: [
              // DataCell(Text(gabah.id.toString())),
              DataCell(Text(gabah.jenis)),
              DataCell(Text(gabah.waktu)),
              DataCell(IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  // Navigate to detail page for the selected gabah item
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GabahDetailScreen(gabah: gabah)),
                  );
                },
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class GabahDetailScreen extends StatelessWidget {
  final Gabah gabah;

  GabahDetailScreen({required this.gabah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gabah Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('ID: ${gabah.id}'),
            // SizedBox(height: 8.0),
            Text('Jenis: ${gabah.jenis}'),
            SizedBox(height: 8.0),
            Text('Waktu Prediksi Kering: ${gabah.waktu}'),
            SizedBox(height: 8.0),
            Text('Suhu: ${gabah.suhu1}'),
            SizedBox(height: 8.0),
            Text('Kadar Air Awal: ${gabah.kadar_air1}'),
            SizedBox(height: 8.0),
            Text('Suhu Akhir: ${gabah.suhu2}'),
            SizedBox(height: 8.0),
            Text('Kadar Air Akhir: ${gabah.kadar_air2}'),
          ],
        ),
      ),
    );
  }
}
