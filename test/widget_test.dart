import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab4pokemon/main.dart';  // Ensure you import your main.dart file

void main() {
  testWidgets('Displays Pokémon cards correctly', (WidgetTester tester) async {
    // Build the widget tree (use the same widget you use in main.dart).
    await tester.pumpWidget(MyApp());

    // Verify that the 'Pokémon Cards' title is present.
    expect(find.text('Pokémon Cards'), findsOneWidget);

    // Verify that the ListView is present (this assumes you have a ListView displaying cards).
    expect(find.byType(ListView), findsOneWidget);

    // Wait for the FutureBuilder to load the data
    await tester.pumpAndSettle();  // Wait for async operations to complete

    // Check if the image of the first Pokémon card is displayed (this assumes the first card has an image URL).
    expect(find.byType(CircleAvatar), findsOneWidget);  // Verify the presence of the first Pokémon image

    // Optionally: Check for the name of the first Pokémon card if it's available.
    expect(find.text('Bulbasaur'), findsOneWidget);  // Replace 'Bulbasaur' with the actual card name in your app

    // Verify if tapping on a Pokémon card opens the enlarged image dialog.
    await tester.tap(find.byType(ListTile).first);  // Tap the first list item
    await tester.pumpAndSettle();

    // Verify that a dialog appears (this assumes a dialog opens when tapping the card).
    expect(find.byType(Dialog), findsOneWidget);
  });
}
