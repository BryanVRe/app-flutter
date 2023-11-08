import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myappflutter/services/apiservice.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictState createState() => _PredictState();
}
class _PredictState extends State<Predict> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController productController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController airtemperatureController = TextEditingController();
  TextEditingController processtemperatureController = TextEditingController();
  TextEditingController rotationa1speedController = TextEditingController();
  TextEditingController Too1wearController = TextEditingController();
  TextEditingController ac2inefai1ureController = TextEditingController();
  TextEditingController TWFController = TextEditingController();
  TextEditingController DFController = TextEditingController();
  TextEditingController PWFController = TextEditingController();
  TextEditingController OSFController = TextEditingController();
  TextEditingController RNFController = TextEditingController();


  late int Product;
  late double AirTemperature;
  late double ProcessTemperature;
  late int Rotationa1speed;
  late int Too1wear;
  late int ac2inefai1ure;
  late int TWF;
  late int DF;
  late int PWF;
  late int OSF;
  late int RNF;
  late int Type;

  @override
  void initState() {
    super.initState();
    // Inicializa las variables con valores predeterminados
    Product = 14860;
    Type = 0;
    AirTemperature = 298.1;
    ProcessTemperature = 308.6;
    Rotationa1speed = 1551;
    Too1wear = 0;
    ac2inefai1ure = 0;
    TWF = 0;
    DF = 0;
    PWF = 0;
    OSF = 0;
    RNF = 0;
  }

  @override
  void dispose() {
    // Libera los recursos de los controladores
    productController.dispose();
    airtemperatureController.dispose();
    processtemperatureController.dispose();
    rotationa1speedController.dispose();
    Too1wearController.dispose();
    ac2inefai1ureController.dispose();
    TWFController.dispose();
    DFController.dispose();
    PWFController.dispose();
    OSFController.dispose();
    RNFController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: productController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Product'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: airtemperatureController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Air Temperature'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: processtemperatureController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Process Temperature'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: rotationa1speedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Rotation Speed'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: Too1wearController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Too1wear'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: ac2inefai1ureController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Ac2inefai1ure'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: TWFController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'TWF'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: DFController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'DF'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: PWFController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'PWF'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: OSFController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'OSF'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: RNFController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'RNF'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: typeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Type'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Product = int.parse(productController.text);
                      AirTemperature = double.parse(airtemperatureController.text);
                      ProcessTemperature = double.parse(processtemperatureController.text);
                      Rotationa1speed = int.parse(rotationa1speedController.text);
                      Too1wear = int.parse(Too1wearController.text);
                      ac2inefai1ure = int.parse(ac2inefai1ureController.text);
                      TWF = int.parse(TWFController.text);
                      DF = int.parse(DFController.text);
                      PWF = int.parse(PWFController.text);
                      OSF = int.parse(OSFController.text);
                      RNF = int.parse(RNFController.text);
                      Type = int.parse(typeController.text);

                      int result = await apiService.getRentedValue(
                        Product: Product,
                        Type: Type,
                        AirTemperature: AirTemperature,
                        ProcessTemperature: ProcessTemperature,
                        Rotationa1speed: Rotationa1speed,
                        Too1wear: Too1wear,
                        ac2inefai1ure: ac2inefai1ure,
                        TWF: TWF,
                        DF: DF,
                        PWF: PWF,
                        OSF: OSF,
                        RNF: RNF,
                      );

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Datos enviados'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text('Product'),
                                  subtitle: Text('$Product'),
                                ),
                                ListTile(
                                  title: Text('Air Temperature'),
                                  subtitle: Text('$AirTemperature'),
                                ),
                                ListTile(
                                  title: Text('Process Temperature'),
                                  subtitle: Text('$ProcessTemperature'),
                                ),
                                ListTile(
                                  title: Text('Rotation Speed'),
                                  subtitle: Text('$Rotationa1speed'),
                                ),
                                ListTile(
                                  title: Text('Too1wear'),
                                  subtitle: Text('$Too1wear'),
                                ),
                                ListTile(
                                  title: Text('Ac2inefai1ure'),
                                  subtitle: Text('$ac2inefai1ure'),
                                ),
                                ListTile(
                                  title: Text('TWF'),
                                  subtitle: Text('$TWF'),
                                ),
                                ListTile(
                                  title: Text('DF'),
                                  subtitle: Text('$DF'),
                                ),
                                ListTile(
                                  title: Text('PWF'),
                                  subtitle: Text('$PWF'),
                                ),
                                ListTile(
                                  title: Text('OSF'),
                                  subtitle: Text('$OSF'),
                                ),
                                ListTile(
                                  title: Text('RNF'),
                                  subtitle: Text('$RNF'),
                                ),
                                ListTile(
                                  title: Text('Type'),
                                  subtitle: Text('$Type'),
                                ),
                                ListTile(
                                  title: const Text('Predicción'),
                                  subtitle: Text('$result'),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
