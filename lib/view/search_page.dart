import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../modal/weatherModal.dart';
import '../provider/weatherProvider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Weatherprovider weatherproviderTrue = Provider.of(context, listen: true);
    Weatherprovider weatherproviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Provider.of<Weatherprovider>(context).fromJson(weatherproviderTrue.searchCity),
          builder: (context, snapshot) {
            WeatherModal? weatherModal = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(weatherModal!.current.is_day == 1 ? day : night),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            alignment: Alignment.topCenter,
                            color: Colors.black45.withOpacity(0.2),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushNamed('/se');
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white12,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Icon(Icons.favorite, color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: TextField(
                                              cursorColor: Colors.white,
                                              onSubmitted: (value) {
                                                weatherproviderFalse.getCity(value);
                                              },
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white.withOpacity(0.2),
                                                hintText: 'Search...',
                                                hintStyle: const TextStyle(color: Colors.white70),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide.none,
                                                ),
                                                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                              ),
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: weatherModal!.current.is_day == 1
                                                ? const AssetImage('assets/images/2.webp')
                                                : const AssetImage('assets/images/crescent-moon-stars-glossy-yellow-white-glossy-clouds-d-style-isolated-realistic-half-moon-moon_1453-removebg-preview.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      weatherModal.current.condition.text,
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      weatherModal.location.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${weatherModal.current.temp_c} °C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 50),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: ()  {
                                              weatherproviderTrue.Weather.add(weatherModal.location.name);
                                              weatherproviderTrue.Weather1.add(weatherModal.current.temp_c);
                                              weatherproviderTrue.Weather2.add(weatherModal.current.condition.text);
                                              weatherproviderTrue.Weather3.add(weatherModal.current.condition.icon);
                                            },
                                            icon: Icon(Icons.favorite_border_outlined,color: Colors.white,)
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              _buildWeatherDetail(
                                                'assets/images/sun.png',
                                                "${weatherModal.current.temp_c}",
                                                'Cloud',
                                              ),
                                              _buildWeatherDetail(
                                                'assets/images/bg2.gif',
                                                "${weatherModal.location.lon}",
                                                'Lon',
                                              ),
                                              _buildWeatherDetail(
                                                'assets/images/home-unscreen.gif',
                                                "${weatherModal.location.lat}",
                                                'Lat',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              _buildWeatherDetail(
                                                'assets/images/wind-removebg-preview (1).png',
                                                "${weatherModal.current.wind_degree}",
                                                'Wind',
                                              ),
                                              _buildWeatherDetail(
                                                'assets/images/hum1-removebg-preview (1).png',
                                                "${weatherModal.current.humidity}",
                                                'Humidity',
                                              ),
                                              _buildWeatherDetail(
                                                'assets/images/uv-removebg-preview.png',
                                                "${weatherModal.current.temp_c}",
                                                'Uv',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            }
          },
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String imagePath, String value, String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 110,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

String night = "assets/images/96dfd411ab0e68f8bc1eb47e4eee8771.gif";
String day = "assets/images/b9894454827733.596dc6164e918.gif";
