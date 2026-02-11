import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/stateless_stateful_demo.dart';
import 'screens/caregiver_discovery_screen.dart';
import 'screens/ratings_screen.dart';
import 'screens/user_input_form.dart';
import 'screens/scrollable_views.dart';
import 'screens/responsive_design_screen.dart';
import 'screens/animations_transitions_demo.dart';
import 'screens/auth_gate.dart';
import 'screens/scrollable_views.dart';
import 'screens/responsive_design_screen.dart';
import 'screens/animations_transitions_demo.dart';
import 'screens/state_management_demo.dart';
import 'screens/assets_demo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HeyBabyApp());
}

class HeyBabyApp extends StatelessWidget {
  const HeyBabyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeyBaby',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const AuthGate(),
      // Define all named routes for the app
      routes: {
        // Home screen - entry point
        '/': (context) => const HomeScreen(),
        
        // Demo screen - Stateless & Stateful widgets
        '/demo': (context) => const StatelessStatefulDemoScreen(),
        
        // Second screen - Basic navigation example
        '/second': (context) => const SecondScreen(),
        
        // Caregiver Discovery - with arguments
        '/discovery': (context) {
          final message = ModalRoute.of(context)?.settings.arguments as String? ??
              'Browse caregivers';
          return CaregiverDiscoveryScreen(message: message);
        },
        
        // Ratings Screen - with complex arguments
        '/ratings': (context) => const RatingsScreen(),
        
        // User Input Form - demonstrates form validation
        '/form': (context) => UserInputForm(),
        
        // Responsive Design - demonstrates MediaQuery and LayoutBuilder
        '/responsive': (context) => const ResponsiveDesignScreen(),
        
        // Animations & Transitions - demonstrates implicit and explicit animations
        '/animations': (context) => const AnimationsTransitionsDemo(),
      },
    );
  }
}

class HeyBabyHomePage extends StatefulWidget {
  const HeyBabyHomePage({super.key});

  @override
  State<HeyBabyHomePage> createState() => _HeyBabyHomePageState();
}

class _HeyBabyHomePageState extends State<HeyBabyHomePage> {
  int _searchCount = 0;

  void _startSearch() {
    setState(() {
      _searchCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeyBaby'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Find Safe & Verified Babysitters ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Searches Started: ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScrollableViews(),
                      ),
                    );
                  },
                  child: const Text('Browse Babysitters'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StateManagementDemo(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('State Management Demo'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AssetsDemoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Assets & Icons Demo'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startSearch,
        backgroundColor: Colors.pink,
        child: const Icon(Icons.search),
      ),
    );
  }
}
