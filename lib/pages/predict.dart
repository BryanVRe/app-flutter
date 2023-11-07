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
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController windSpeedController = TextEditingController();
  TextEditingController visibilityController = TextEditingController();
  TextEditingController dewPointController = TextEditingController();
  TextEditingController solarRadiationController = TextEditingController();
  TextEditingController rainfallController = TextEditingController();
  TextEditingController snowfallController = TextEditingController();
  TextEditingController seasonController = TextEditingController();
  TextEditingController isHolidayController = TextEditingController();
  TextEditingController isFunctioningDayController = TextEditingController();
  late int selectedDate;
  late int hour = 0;
  late int season = 1;
  late int isHoliday = 1;
  late int isFunctioningDay = 1;
  late double temperature = 0;
  late double humidity = 0;
  late double windSpeed = 0;
  late double visibility = 0;
  late double dewPoint = 0;
  late double solarRadiation = 0;
  late double rainfall = 0;
  late double snowfall = 0;

  @override
  void initState() {
    super.initState();
    hourController.addListener(() {
      final text = hourController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          hour = value;
        } catch (e) {
          hourController.text = hour.toString();
        }
      }
    });

    temperatureController.addListener(() {
      final text = temperatureController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          temperature = value;
        } catch (e) {
          temperatureController.text = temperature.toString();
        }
      }
    });

    humidityController.addListener(() {
      final text = humidityController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          humidity = value;
        } catch (e) {
          humidityController.text = humidity.toString();
        }
      }
    });

    windSpeedController.addListener(() {
      final text = windSpeedController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          windSpeed = value;
        } catch (e) {
          windSpeedController.text = windSpeed.toString();
        }
      }
    });

    visibilityController.addListener(() {
      final text = visibilityController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          visibility = value;
        } catch (e) {
          visibilityController.text = visibility.toString();
        }
      }
    });

    dewPointController.addListener(() {
      final text = dewPointController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          dewPoint = value;
        } catch (e) {
          dewPointController.text = dewPoint.toString();
        }
      }
    });

    solarRadiationController.addListener(() {
      final text = solarRadiationController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          solarRadiation = value;
        } catch (e) {
          solarRadiationController.text = solarRadiation.toString();
        }
      }
    });

    rainfallController.addListener(() {
      final text = rainfallController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          rainfall = value;
        } catch (e) {
          rainfallController.text = rainfall.toString();
        }
      }
    });

    snowfallController.addListener(() {
      final text = snowfallController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          snowfall = value;
        } catch (e) {
          snowfallController.text = snowfall.toString();
        }
      }
    });

    seasonController.addListener(() {
      final text = seasonController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          season = value;
        } catch (e) {
          seasonController.text = season.toString();
        }
      }
    });

    isHolidayController.addListener(() {
      final text = isHolidayController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          isHoliday = value;
        } catch (e) {
          isHolidayController.text = isHoliday.toString();
        }
      }
    });

    isFunctioningDayController.addListener(() {
      final text = isFunctioningDayController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          isFunctioningDay = value;
        } catch (e) {
          isFunctioningDayController.text = isFunctioningDay.toString();
        }
      }
    });
  }

  @override
  void dispose() {
    hourController.dispose();
    temperatureController.dispose();
    humidityController.dispose();
    windSpeedController.dispose();
    visibilityController.dispose();
    dewPointController.dispose();
    solarRadiationController.dispose();
    rainfallController.dispose();
    snowfallController.dispose();
    seasonController.dispose();
    isHolidayController.dispose();
    isFunctioningDayController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final formattedDate = DateFormat('ddMMyyyy').format(picked);
      setState(() {
        selectedDate = int.parse(formattedDate);
        dateController.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Predicción'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //.
              //____________________________________ DATE ____________________________________
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date (ddMMyyyy)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa la fecha.';
                  }
                  return null;
                },
                onTap: () {
                  _selectDate(context);
                },
              ),
              //.
              //____________________________________ HOUR ____________________________________
              TextFormField(
                controller: hourController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Hour'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ TEMPERATURE ____________________________________
              TextFormField(
                controller: temperatureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Temperature'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ HUMIDITY ____________________________________
              TextFormField(
                controller: humidityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Humidity'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ WINDSPEED ____________________________________
              TextFormField(
                controller: windSpeedController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'windSpeed'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ VISIBILITY ____________________________________
              TextFormField(
                controller: visibilityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'visibility'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ DEWPOINT ____________________________________
              TextFormField(
                controller: dewPointController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'dewPoint'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ SOLARRADIATION ____________________________________
              TextFormField(
                controller: solarRadiationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'solarRadiation'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ RAIN ____________________________________
              TextFormField(
                controller: rainfallController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'rainfall'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ SNOWFALL ____________________________________
              TextFormField(
                controller: snowfallController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'snowfall'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              //.
              //____________________________________ season ____________________________________
              DropdownButtonFormField<int>(
                value: season,
                onChanged: (int? value) {
                  setState(() {
                    season = value!;
                    seasonController.text = value.toString();
                  });
                },
                decoration: const InputDecoration(labelText: 'season'),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Winter'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Spring'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Summer'),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text('Autumn'),
                  ),
                ],
              ),
              //.
              //____________________________________ ISHOLIDAY ____________________________________
              DropdownButtonFormField<int>(
                value: isHoliday,
                onChanged: (int? value) {
                  setState(() {
                    isHoliday = value!;
                    isHolidayController.text = value.toString();
                  });
                },
                decoration: const InputDecoration(labelText: 'IsHoliday'),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Si'),
                  ),
                  DropdownMenuItem(
                    value: 0,
                    child: Text('No'),
                  ),
                ],
              ),
              //.
              //____________________________________ ISFUNCTIONINGDAY ____________________________________
              DropdownButtonFormField<int>(
                value: isFunctioningDay,
                onChanged: (int? value) {
                  setState(() {
                    isFunctioningDay = value!;
                    isFunctioningDayController.text = value.toString();
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'IsFunctioningDay'),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Si'),
                  ),
                  DropdownMenuItem(
                    value: 0,
                    child: Text('No'),
                  ),
                ],
              ),
              //.
              //____________________________________ BOTON ____________________________________
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Llamada a la función que consume la API
                    print("boton");
                    int result = await apiService.getRentedValue(
                        date: selectedDate,
                        hour: hour,
                        temperature: temperature,
                        humidity: humidity,
                        windSpeed: windSpeed,
                        visibility: visibility,
                        dewPoint: dewPoint,
                        solarRadiation: solarRadiation,
                        rainfall: rainfall,
                        snowfall: snowfall,
                        season: season,
                        isHoliday: isHoliday,
                        isFunctioningDay: isFunctioningDay);
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Datos enviados'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Date: $selectedDate'),
                              Text('Hour: $hour'),
                              Text('temperature: $temperature'),
                              Text('humidity: $humidity'),
                              Text('windSpeed: $windSpeed'),
                              Text('visibility: $visibility'),
                              Text('dewPoint: $dewPoint'),
                              Text('solarRadiation: $solarRadiation'),
                              Text('rainfall: $rainfall'),
                              Text('snowfall: $snowfall'),
                              Text('season: $season'),
                              Text('isHoliday: $isHoliday'),
                              Text('isFunctioningDay: $isFunctioningDay'),
                              Text('Predicción: $result'),
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
                    //--------------
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
