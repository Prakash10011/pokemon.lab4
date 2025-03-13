// lib/main.dart
import 'package:flutter/material.dart';
import 'lib/pokemon_service.dart';
import 'pokemon_card.dart';
import 'pokemon_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonCardList(),
    );
  }
}

class PokemonCardList extends StatefulWidget {
  @override
  _PokemonCardListState createState() => _PokemonCardListState();
}

class _PokemonCardListState extends State<PokemonCardList> {
  late Future<List<PokemonCard>> futureCards;

  @override
  void initState() {
    super.initState();
    futureCards = PokemonService().fetchPokemonCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Cards'),
      ),
      body: FutureBuilder<List<PokemonCard>>(
        future: futureCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Pokémon cards available.'));
          } else {
            List<PokemonCard> cards = snapshot.data!;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                PokemonCard card = cards[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: card.imageUrl,
                      width: 50,
                      height: 50,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(card.name),
                    onTap: () {
                      // Show enlarged image when tapped
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: CachedNetworkImage(
                            imageUrl: card.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
