// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:coffee_shop/presentation/splash/animated_splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coffee_shop/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App verification smoke test', (WidgetTester tester) async {
    // Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(showOnboarding: true));

    // Verify that the AnimatedSplashScreen is displayed.
    expect(find.byType(AnimatedSplashScreen), findsOneWidget);

    // Allow time for the splash screen timer (2s) and animation (3s) to complete
    await tester.pump(const Duration(seconds: 5));
  });
}
