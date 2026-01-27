import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget - Demonstrates MaterialApp structure
/// 
/// Widget Tree:
/// MyApp (StatelessWidget)
/// └── MaterialApp
///     └── WidgetTreeDemo (home)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Tree & Reactive UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WidgetTreeDemo(),
    );
  }
}

/// Main demonstration widget - Shows complete widget hierarchy
/// Demonstrates reactive UI with multiple state updates
/// 
/// Widget Hierarchy:
/// WidgetTreeDemo (StatefulWidget)
/// └── Scaffold
///     ├── AppBar
///     └── Body (SingleChildScrollView)
///         └── Column
///             ├── ProfileCard
///             ├── SizedBox
///             ├── InteractiveCounter
///             ├── SizedBox
///             ├── ColorToggleButton
///             ├── SizedBox
///             ├── WidgetVisibilityToggle
///             └── WidgetTreeStructure
class WidgetTreeDemo extends StatefulWidget {
  const WidgetTreeDemo({super.key});

  @override
  State<WidgetTreeDemo> createState() => _WidgetTreeDemoState();
}

class _WidgetTreeDemoState extends State<WidgetTreeDemo> {
  // State variables - control reactive updates
  int _counter = 0;
  Color _bgColor = Colors.white;
  bool _showHiddenWidget = false;

  // Increment counter and trigger rebuild
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Decrement counter and trigger rebuild
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Toggle background color and trigger rebuild
  void _toggleBackgroundColor() {
    setState(() {
      _bgColor = _bgColor == Colors.white ? Colors.blue.shade50 : Colors.white;
    });
  }

  // Toggle widget visibility and trigger rebuild
  void _toggleWidgetVisibility() {
    setState(() {
      _showHiddenWidget = !_showHiddenWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree & Reactive UI Example'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: _bgColor,
          child: Column(
            children: [
              // 1. Profile Card - Nested widget hierarchy example
              const ProfileCard(
                name: 'Flutter Developer',
                bio: 'Learning Widget Trees & Reactive UI',
              ),
              const SizedBox(height: 24),

              // 2. Interactive Counter - State management demo
              InteractiveCounter(
                count: _counter,
                onIncrement: _incrementCounter,
                onDecrement: _decrementCounter,
              ),
              const SizedBox(height: 24),

              // 3. Color Toggle Button - Background color change
              Center(
                child: ElevatedButton.icon(
                  onPressed: _toggleBackgroundColor,
                  icon: const Icon(Icons.palette),
                  label: Text(
                    _bgColor == Colors.white ? 'Enable Dark Mode' : 'Disable Dark Mode',
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. Widget Visibility Toggle
              WidgetVisibilityToggle(
                isVisible: _showHiddenWidget,
                onToggle: _toggleWidgetVisibility,
              ),

              // 5. Conditionally rendered widget - Demonstrates reactive rendering
              if (_showHiddenWidget)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Text(
                      '✓ Hidden widget is now visible! This demonstrates conditional rendering in the reactive UI model.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              // 6. Widget Tree Structure Documentation
              const WidgetTreeStructure(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// ProfileCard - Demonstrates nested widget hierarchy
/// 
/// Widget Tree:
/// ProfileCard
/// └── Container
///     └── Column
///         ├── CircleAvatar
///         ├── SizedBox
///         ├── Text (name)
///         ├── SizedBox
///         └── Text (bio)
class ProfileCard extends StatelessWidget {
  final String name;
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade600,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

/// InteractiveCounter - Demonstrates reactive state updates
/// 
/// Widget Tree:
/// InteractiveCounter
/// └── Container
///     └── Column
///         ├── Text (counter display)
///         ├── SizedBox
///         └── Row
///             ├── ElevatedButton (decrement)
///             ├── SizedBox
///             └── ElevatedButton (increment)
class InteractiveCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const InteractiveCounter({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Reactive Counter Example',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade600,
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
    );
  }
}
