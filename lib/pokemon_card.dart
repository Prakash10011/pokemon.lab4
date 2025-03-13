// lib/pokemon_card.dart
class PokemonCard {
  final String name;
  final String imageUrl;

  PokemonCard({required this.name, required this.imageUrl});

  // Factory method to create a PokemonCard from JSON
  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      name: json['name'] as String,
      imageUrl: json['images']['small'] as String,  // Adjust based on the actual API response structure
    );
  }
}
