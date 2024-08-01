import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_app/provider/weatherProvider.dart';
import 'package:wether_app/view/favourite_page.dart';
import 'package:wether_app/view/search_page.dart';
import 'package:wether_app/view/splash_screen.dart';

void main() {
  runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Weatherprovider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> const SplashScreen(),
          '/search':(context)=> const SearchPage(),
          '/se':(context)=> const FavouritePage(),
        },
      ),
    );
  }
}

