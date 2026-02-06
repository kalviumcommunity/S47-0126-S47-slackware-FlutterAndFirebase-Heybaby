import 'package:flutter/material.dart';
import 'screens/scrollable_views.dart';
import 'screens/state_management_demo.dart';

void main() {
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
      home: const HeyBabyHomePage(),
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
