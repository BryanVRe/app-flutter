import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  final String baseUrl = 'https://machinefp-service-bryanvre.cloud.okteto.net';

  Future<double> getRentedValue({
    required int Product,
    required int Type,
    required double AirTemperature,
    required double ProcessTemperature,
    required int Rotationa1speed,
    required int Too1wear,
    required int ac2inefai1ure,
    required int TWF,
    required int DF,
    required int PWF,
    required int OSF,
    required int RNF,
  }) async {
    final Uri url = Uri.parse('$baseUrl/score');

    // Construye el cuerpo de la solicitud, ajustando los nombres de los campos
    final Map<String, dynamic> requestBody = {
      'Product': Product,
      'Type': Type,
      'Air Temperature': AirTemperature,
      'Process Temperature': ProcessTemperature,
      'Rotationa1speed': Rotationa1speed,
      'Too1wear': Too1wear,
      'ac2inefai1ure': ac2inefai1ure,
      'TWF': TWF,
      'DF': DF,
      'PWF': PWF,
      'OSF': OSF,
      'RNF': RNF,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData['score']);
      double valor=responseData['score'];
      print("valor");
      print(valor);
      return valor; // Convert the response to a double
    } else {
      throw Exception('Error al consumir la API');
    }
  }
}