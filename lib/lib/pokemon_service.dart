// lib/pokemon_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pokemon_card.dart';
import 'pokemon_card.dart';  // Import the PokemonCard model.

class PokemonService {
  static const String apiUrl = 'https://api.pokemontcg.io/v2/cards';

  // Fetch Pokémon cards from the API
  Future<List<PokemonCard>> fetchPokemonCards() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);  // Decode the JSON response
      List cards = data['data'];  // Access the 'data' key in the response
      // Map the raw data to a list of PokemonCard objects
      return cards.map((card) => PokemonCard.fromJson(card)).toList();
    } else {
      throw Exception('Failed to load Pokémon cards');  // Error handling
    }
  }
}
