// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:heybaby/main.dart';

void main() {
  testWidgets('Welcome app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our welcome text is present.
    expect(find.text('Welcome to Flutter!'), findsOneWidget);
    
    // Verify that the button starts with 'Activate'.
    expect(find.text('Activate'), findsOneWidget);
    expect(find.text('Deactivate'), findsNothing);

    // Tap the 'Activate' button and trigger a frame.
    await tester.tap(find.text('Activate'));
    await tester.pump();

    // Verify that the button text changed to 'Deactivate'.
    expect(find.text('Activate'), findsNothing);
    expect(find.text('Deactivate'), findsOneWidget);
  });
}
