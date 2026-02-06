import 'package:flutter/material.dart';

/// StateManagementDemo - Comprehensive example of local state management using setState()
/// 
/// This widget demonstrates:
/// 1. How Stateful widgets maintain state
/// 2. How setState() triggers UI updates
/// 3. Conditional logic based on state changes
/// 4. Best practices for state management
class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  // State variables
  int _counter = 0;
  bool _isDarkMode = false;
  String _selectedAction = 'Counter';
  int _totalTaps = 0;

  // Method to increment counter
  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalTaps++;
    });
  }

  // Method to decrement counter
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _totalTaps++;
      }
    });
  }

  // Method to reset counter
  void _resetCounter() {
    setState(() {
      _counter = 0;
      _totalTaps = 0;
    });
  }

  // Method to toggle dark mode
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  // Method to change selected action
  void _changeAction(String action) {
    setState(() {
      _selectedAction = action;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine background color based on state
    Color backgroundColor = _isDarkMode ? Colors.grey.shade900 : Colors.white;
    Color textColor = _isDarkMode ? Colors.white : Colors.black;
    Color accentColor = _counter >= 10 ? Colors.greenAccent : Colors.blueAccent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Demo'),
        backgroundColor: _isDarkMode ? Colors.grey.shade800 : Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleDarkMode,
            tooltip: 'Toggle Dark Mode',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title Section
                Text(
                  'Interactive State Management',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap buttons to see setState() in action',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Counter Section
                Container(
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: accentColor,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Button Press Counter',
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _counter == 0
                            ? 'No taps yet'
                            : _counter == 1
                                ? '1 tap - Getting started! 🚀'
                                : _counter < 5
                                    ? '$_counter taps - Keep going! 💪'
                                    : _counter < 10
                                        ? '$_counter taps - Great progress! ⭐'
                                        : '$_counter taps - Amazing! 🔥',
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withOpacity(0.8),
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _decrementCounter,
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrease'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _incrementCounter,
                      icon: const Icon(Icons.add),
                      label: const Text('Increase'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade400,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _resetCounter,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade400,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Stats Section
                Container(
                  decoration: BoxDecoration(
                    color: _isDarkMode
                        ? Colors.grey.shade800
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session Statistics',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildStatRow('Total Taps:', '$_totalTaps', textColor),
                      _buildStatRow(
                        'Current Count:',
                        '$_counter',
                        textColor,
                      ),
                      _buildStatRow(
                        'Mode:',
                        _isDarkMode ? 'Dark 🌙' : 'Light ☀️',
                        textColor,
                      ),
                      _buildStatRow(
                        'Milestone:',
                        _counter >= 10
                            ? '✅ Reached 10+'
                            : '⏳ Target: 10',
                        textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Educational Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How setState() Works:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoItem(
                        '1. User taps a button',
                        'The button\'s onPressed callback is triggered',
                        textColor,
                      ),
                      _buildInfoItem(
                        '2. setState() is called',
                        'State variables update inside setState block',
                        textColor,
                      ),
                      _buildInfoItem(
                        '3. Framework rebuilds widget',
                        'Only affected parts of the tree re-render',
                        textColor,
                      ),
                      _buildInfoItem(
                        '4. UI updates automatically',
                        'Users see the new state instantly',
                        textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Code Example Section
                Container(
                  decoration: BoxDecoration(
                    color: _isDarkMode
                        ? Colors.grey.shade800
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Code Example:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        color: Colors.black.withOpacity(0.1),
                        padding: const EdgeInsets.all(12),
                        borderRadius: BorderRadius.circular(8),
                        child: Text(
                          '''void _incrementCounter() {
  setState(() {
    _counter++;  // Update state
  });
}''',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Best Practices Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.amber,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⚠️ Common Mistakes to Avoid:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildMistakeItem(
                        '❌ Updating variables outside setState()',
                        'Changes won\'t trigger UI updates',
                        textColor,
                      ),
                      _buildMistakeItem(
                        '❌ Calling setState() inside build()',
                        'This causes infinite rebuild loops',
                        textColor,
                      ),
                      _buildMistakeItem(
                        '❌ Using setState() for complex app state',
                        'Use Provider, Riverpod, or similar for large apps',
                        textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String description, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMistakeItem(String mistake, String explanation, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mistake,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.red.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            explanation,
            style: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
