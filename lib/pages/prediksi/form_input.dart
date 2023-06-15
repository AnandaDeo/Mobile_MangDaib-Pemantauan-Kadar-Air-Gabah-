import 'dart:convert';
import 'package:belajar/pages/prediksi/dataGabah.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionForm extends StatefulWidget {
  @override
  _PredictionFormState createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController massaController = TextEditingController();
  TextEditingController suhuAwalController = TextEditingController();
  TextEditingController kadarAirAwalController = TextEditingController();
  TextEditingController suhuAkhirController = TextEditingController();
  TextEditingController kadarAirAkhirController = TextEditingController();
  TextEditingController jenisGabahController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final apiUrl = 'http://10.0.141.93:5000/predict';
      final headers = {'Content-Type': 'application/json'};
      final data = {
        'massa': double.parse(massaController.text),
        'suhu_awal': double.parse(suhuAwalController.text),
        'kadar_air_awal': double.parse(kadarAirAwalController.text),
        'suhu_akhir': double.parse(suhuAkhirController.text),
        'kadar_air_akhir': double.parse(kadarAirAkhirController.text),
        'jenis_gabah': jenisGabahController.text,
      };
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final predictedTime = responseData['data']['predicted_time'];
        final hours = predictedTime['hours'];
        final minutes = predictedTime['minutes'];
        final seconds = predictedTime['seconds'];

        // Reset form input values
        massaController.clear();
        suhuAwalController.clear();
        kadarAirAwalController.clear();
        suhuAkhirController.clear();
        kadarAirAkhirController.clear();
        jenisGabahController.clear();

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Prediction Result'),
            content: Text(
              'Predicted Time: $hours hours, $minutes minutes, $seconds seconds',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Prediction Failed'),
            content: Text(
              'Failed to make a prediction. Please try again later.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Form'),
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.menu),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add your sidebar content here
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.only(bottom: 0),
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                  const Spacer(),
                  Text(
                    'Validator',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Data Gabah'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => GabahScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: massaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Massa'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the massa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: suhuAwalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Suhu Awal'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the suhu awal';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: kadarAirAwalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Kadar Air Awal'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the kadar air awal';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: suhuAkhirController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Suhu Akhir'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the suhu akhir';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: kadarAirAkhirController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Kadar Air Akhir'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the kadar air akhir';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: jenisGabahController,
                  decoration: InputDecoration(labelText: 'Jenis Gabah'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the jenis gabah';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Predict'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
