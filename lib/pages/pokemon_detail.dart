import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text(
          pokemon.name.toString(),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  pokemon.name.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Height: ${pokemon.height}"),
                Text("Weight: ${pokemon.weight}"),
                const Text(
                  "Types",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type!
                        .map((e) => FilterChip(
                            backgroundColor: Colors.amber,
                            label:
                                Text(e, style: TextStyle(color: Colors.white)),
                            onSelected: (b) {}))
                        .toList()),
                Text(
                  "Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses!
                        .map((e) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList()),
                const Text(
                  "Next Evulation",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (pokemon.nextEvolution ?? [])
                        .map((e) => FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(e.name.toString(),
                                style: TextStyle(color: Colors.white)),
                            onSelected: (b) {}))
                        .toList()),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img.toString(),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(pokemon.img.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
