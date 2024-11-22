import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

//
class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  bool _isLoading = false;
  Map<String, dynamic>? _weatherData;

  Future<void> fetchWeather(String city) async {
    const String apiKey = 'b38343258f7d4530947191959242111';
    final String url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no';

    setState(() {
      _isLoading = true;
      _weatherData = null;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          _weatherData = json.decode(response.body);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Город не найден')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: 'Название города',
                labelText: 'Город',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_cityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Пожалуйста, введите название города')),
                  );
                } else {
                  fetchWeather(_cityController.text);
                }
              },
              child: const Text('Получить погоду'),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_weatherData != null)
              WeatherCard(data: _weatherData!)
            else
              const Text(
                'Для получения прогноза необходимо ввести название города на английском языке',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const WeatherCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final location = data['location'];
    final current = data['current'];

    return Card(
      child: ListTile(
        leading: Image.network(
          'https:${current['condition']['icon']}',
          width: 50,
          height: 50,
        ),
        title: Text(
          '${location['name']}, ${location['country']}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${current['temp_c']}°C, ${current['condition']['text']}',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${current['humidity']}% влажность'),
            Text('${current['wind_kph']} км/ч ветер'),
          ],
        ),
      ),
    );
  }
}