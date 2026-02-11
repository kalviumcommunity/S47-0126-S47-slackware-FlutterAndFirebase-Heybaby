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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Find Safe & Verified Babysitters 👶',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Searches Started: $_searchCount',
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
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove),
                label: const Text('Decrease'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: onIncrement,
                icon: const Icon(Icons.add),
                label: const Text('Increase'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// WidgetVisibilityToggle - Demonstrates conditional rendering
/// 
/// Widget Tree:
/// WidgetVisibilityToggle
/// └── Center
///     └── ElevatedButton
class WidgetVisibilityToggle extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;

  const WidgetVisibilityToggle({
    super.key,
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: onToggle,
        icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
        label: Text(isVisible ? 'Hide Widget' : 'Show Hidden Widget'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade400,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

/// WidgetTreeStructure - Displays the widget hierarchy as documentation
/// 
/// Widget Tree:
/// WidgetTreeStructure
/// └── Padding
///     └── Card
///         └── Padding
///             └── Column
///                 └── Text (multiple)
class WidgetTreeStructure extends StatelessWidget {
  const WidgetTreeStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Widget Tree Structure:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildTreeText('WidgetTreeDemo (StatefulWidget)'),
              _buildTreeText('└── Scaffold', indent: 1),
              _buildTreeText('├── AppBar', indent: 2),
              _buildTreeText('└── Body (SingleChildScrollView)', indent: 2),
              _buildTreeText('└── Column', indent: 3),
              _buildTreeText('├── ProfileCard (Custom)', indent: 4),
              _buildTreeText('├── InteractiveCounter (Custom)', indent: 4),
              _buildTreeText('├── ColorToggleButton', indent: 4),
              _buildTreeText('├── WidgetVisibilityToggle (Custom)', indent: 4),
              _buildTreeText('├── ConditionalWidget (if _showHiddenWidget)', indent: 4),
              _buildTreeText('└── WidgetTreeStructure (Custom)', indent: 4),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Text(
                'How the Reactive Model Works:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildReferenceText(
                '1. When you tap a button, it calls setState()',
              ),
              _buildReferenceText(
                '2. setState() updates state variables (_counter, _bgColor, etc.)',
              ),
              _buildReferenceText(
                '3. The framework automatically rebuilds the widget tree',
              ),
              _buildReferenceText(
                '4. Only affected widgets are re-rendered (optimization)',
              ),
              _buildReferenceText(
                '5. The UI reflects the new state instantly',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTreeText(String text, {int indent = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: indent * 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildReferenceText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade700,
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
