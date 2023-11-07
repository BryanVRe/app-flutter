import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FitService with ChangeNotifier{
  final String baseUrl =
      'https://api.github.com/repos/btoarriola/biciclefastapi/dispatches';

  Future<void> getFit({
  required int dataset,
  }) async {
    final Uri url = Uri.parse(baseUrl);
    // ignore: avoid_print
    print(url);
    String dataseturl="";
    switch (dataset){
      case 1:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/biciclefastapi.appspot.com/o/train.csv?alt=media&token=f2c515e8-e6bf-4dcd-9923-c80db4f229d4";
        break;
      case 2:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/biciclefastapi.appspot.com/o/train50.csv?alt=media&token=e6603e86-b417-454a-a6b0-3c0397771fd0";
        break;
      case 3:
        dataseturl="https://firebasestorage.googleapis.com/v0/b/biciclefastapi.appspot.com/o/train25.csv?alt=media&token=7ba3d970-3999-4974-88be-2c814459dbd1";
        break;
    }

    // Construye el cuerpo de la solicitud, si es necesario
    final Map<String, dynamic> requestBody = {
      "event_type": "ml_ci_cd",
      "client_payload": {
        "dataseturl": dataseturl,
        "sha": "bto"
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
