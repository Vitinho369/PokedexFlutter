import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/repositories/pokemon_repostorie.dart';
import 'package:pokedex/features/pokedex/route.dart';
import 'package:pokedex/features/pokedex/screens/home/container/home_container.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Pokedex 2022",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      home: PokedexRoute(
        repository: PokemonRepository(
            dio: Dio()
            )
          )
    );
  }
}