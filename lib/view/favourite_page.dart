import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_app/view/search_page.dart';

import '../modal/weatherModal.dart';
import '../provider/weatherProvider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Weatherprovider weatherproviderTrue = Provider.of(context, listen: true);
    Weatherprovider weatherproviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Provider.of<Weatherprovider>(context)
              .fromJson(weatherproviderTrue.searchCity),
          builder: (context, snapshot) {
            WeatherModal? weatherModal = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://mir-s3-cdn-cf.behance.net/project_modules/disp/d8b05154827733.596dc77a0361f.gif"),
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
                              child: Column(
                                children: [

                                  ...List.generate(
                                    weatherproviderTrue.Weather.length,
                                        (index) => Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Container(
                                        height: 90,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        alignment: Alignment.center,
                                        child: ListTile(
                                          leading: Image.network('http:${weatherproviderTrue.Weather3[index]}'),

                                          title: Text(
                                            weatherproviderTrue.Weather[index],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          subtitle: Text(
                                            weatherproviderTrue.Weather2[index],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Temp',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              Text(
                                                '${weatherproviderTrue.Weather1[index]} °C',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.white,));
            }
          },
        ),
      ),
    );
  }
}
