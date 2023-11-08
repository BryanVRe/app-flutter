import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FitService with ChangeNotifier{
  final String baseUrl =
      'https://api.github.com/repos/bryanvre/machinef/dispatches';

  Future<void> getFit({
    required String sha,
  required int dataset,
  }) async {
    final Uri url = Uri.parse(baseUrl);
    // ignore: avoid_print
    print(url);
    String dataseturl="";
    switch (dataset){
      case 1:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/machine-failure.appspot.com/o/machine-failure_100.csv?alt=media&token=864de8fe-29b8-4be4-820d-22e0548f4a99";
        break;
      case 2:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/machine-failure.appspot.com/o/machine-failure_50.csv?alt=media&token=19168c13-c807-460b-b12e-c3bb109e4453";
        break;
      case 3:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/machine-failure.appspot.com/o/machine-failure_25.csv?alt=media&token=6762b9e3-27d3-4c03-994c-8191bad18d22";
        break;
    }

    // Construye el cuerpo de la solicitud, si es necesario
    final Map<String, dynamic> requestBody = {
      "event_type": "ml_ci_cd",
      "client_payload": {
        "dataseturl": dataseturl,
        "sha": sha
      }
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer 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',
        'Accept': 'application/vnd.github.v3+json',
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
  }
}
