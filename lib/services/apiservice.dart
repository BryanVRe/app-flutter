import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier{
  final String baseUrl =
      'https://biciclefastapi-service-btoarriola.cloud.okteto.net';

  Future<int> getRentedValue(
      {required int date,
      required int hour,
      required double temperature,
      required double humidity,
      required double windSpeed,
      required double visibility,
      required double dewPoint,
      required double solarRadiation,
      required double rainfall,
      required double snowfall,
      required int season,
      required int isHoliday,
      required int isFunctioningDay}) async {
    final Uri url = Uri.parse('$baseUrl/rented');
    // ignore: avoid_print
    print(url);

    // Construye el cuerpo de la solicitud, si es necesario
    final Map<String, dynamic> requestBody = {
      'Date': date,
      'Hour': hour,
      'Temperature': temperature,
      'Humidity': humidity,
      'Wind_Speed': windSpeed,
      'Visibility': visibility,
      'Dew_Point': dewPoint,
      'Solar_Radiation': solarRadiation,
      'Rainfall': rainfall,
      'Snowfall': snowfall,
      'Season': season,
      'IsHoliday': isHoliday,
      'IsFunctioningDay': isFunctioningDay,
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // El valor entero que recibes se encuentra en responseData
      return responseData['Bikes_Rented'];
    } else {
      throw Exception('Error al consumir la API');
    }
  }
}
