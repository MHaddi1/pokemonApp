import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/pokemon_detail.dart';
import 'package:pokemon_app/pages/widgets/skelton.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  PokeHub pokehub = PokeHub();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        pokehub = PokeHub.fromJson(decodedJson);
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Poke App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          if (pokehub.pokemon != null && pokehub.pokemon!.isNotEmpty)
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pokehub.pokemon!.length,
              itemBuilder: (context, index) {
                var pokemon = pokehub.pokemon![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetail(
                          pokemon: pokemon,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: pokemon.img.toString(),
                    child: Card(
                      elevation: 3.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(pokemon.img
                                    .toString()), // Use CachedNetworkImageProvider here
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            pokemon.name.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ); 
              },
            ),
          if (isLoading) const Skelton(),
        ],
      ),
    );
  }
}
