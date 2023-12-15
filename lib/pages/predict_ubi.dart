import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myappflutter/services/ubications_service.dart';
class MapPredict extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mapService = Provider.of<MapService>(context);

    // Define los controladores para los campos de entrada
    final kasagistanLatitudeController = TextEditingController();
    final kasagistanLongitudeController = TextEditingController();
    final brasiliaLatitudeController = TextEditingController();
    final brasiliaLongitudeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Predictor de ubicaciones geográficas'), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Coordenadas para Kasagistan'),
            TextFormField(
              controller: kasagistanLatitudeController,
              decoration: InputDecoration(labelText: 'Latitud'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: kasagistanLongitudeController,
              decoration: InputDecoration(labelText: 'Longitud'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text('Coordenadas para Brasilia'),
            TextFormField(
              controller: brasiliaLatitudeController,
              decoration: InputDecoration(labelText: 'Latitud'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: brasiliaLongitudeController,
              decoration: InputDecoration(labelText: 'Longitud'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final kasagistanLatitude = double.parse(kasagistanLatitudeController.text);
                final kasagistanLongitude = double.parse(kasagistanLongitudeController.text);
                final brasiliaLatitude = double.parse(brasiliaLatitudeController.text);
                final brasiliaLongitude = double.parse(brasiliaLongitudeController.text);

                final inputs = [
                  [kasagistanLongitude, kasagistanLatitude],
                  [brasiliaLongitude, brasiliaLatitude]
                ];

                mapService.makePrediction(inputs).then((predictions) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Predicciones'),
                        content: Text('Predicciones para Kasagistan: ${predictions['predictions'][0]}'
                            '\n Predicciones para Brasilia: ${predictions['predictions'][1]}' ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                  print('Predicciones para Kasagistan: ${predictions['predictions'][0]}');
                  print('Predicciones para Brasilia: ${predictions['predictions'][1]}');
                }).catchError((error) {
                  // Manejar errores aquí
                  print('Error al predecir: $error');
                });
              },
              child: Text('Predecir'),
            ),
          ],
        ),
      ),
    );
  }
}
