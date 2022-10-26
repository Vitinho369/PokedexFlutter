import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/repositories/pokemon_repostorie.dart';
import 'package:pokedex/features/pokedex/details/pages/detail_page.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_loading.dart';

class DetailArguments{
  final String name;

  DetailArguments({required this.name});
}


class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments}) : super(key: key);
  final iPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
     return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return HomeLoading();
        }

        if(snapshot.connectionState ==  ConnectionState.done && snapshot.hasData){
          return DetailPage(
              name: arguments.name,
              list: snapshot.data!,
            );
        }

        if(snapshot.hasError){
          return HomeError(
              error: (snapshot.error as Failure).message!
            );
        }

        return Container();
    });
  }
}