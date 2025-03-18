Pokémon Card App:

Overview:
This is a Pokémon Card app built using Flutter. The app fetches data from the Pokémon TCG API and displays a list of Pokémon cards. Users can tap on a card to view an enlarged version of the card image. The app handles loading states and network errors gracefully.

Features:
Fetches Pokémon card data from the Pokémon TCG API
Displays a list of Pokémon cards using ListView
Uses CachedNetworkImage for efficient image loading and caching
Allows users to view an enlarged version of a Pokémon card by tapping on it
Handles loading and error states with appropriate feedback

How It Works:
Data Fetching:

PokemonService sends an HTTP GET request to the Pokémon TCG API.
Response data is decoded from JSON and mapped to a list of PokemonCard objects.

UI Display:

A FutureBuilder waits for the data to load.
On success → Displays the list of cards.
On failure → Displays an error message.
Card Interaction:

When a user taps on a card, a dialog opens displaying an enlarged image.
Images are loaded and cached using CachedNetworkImage.

State Management:

setState() updates the list of cards once data is fetched.
Handles loading and error states dynamically.

Project Structure
Key Files:

main.dart – Contains the main app logic and UI.
pokemon_card.dart – Defines the PokemonCard model and JSON mapping.
pokemon_service.dart – Handles network requests and data processing.
pubspec.yaml – Manages dependencies like http and cached_network_image.

State Management:
setState() updates the card list and UI state dynamically.
FutureBuilder handles the asynchronous state while fetching data.

Changes Made:
Implemented API integration using http package.
Added image loading and caching using CachedNetworkImage.
Handled loading and error states with feedback to the user.
Created responsive UI with dynamic data handling.

Why These Changes:
To provide real-time Pokémon card data using an external API.
To improve performance and user experience with efficient image loading.
To make the app responsive and user-friendly with interactive feedback.
