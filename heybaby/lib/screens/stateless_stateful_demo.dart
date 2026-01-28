import 'package:flutter/material.dart';

/// Stateless Widget Demo - Header Component
/// This widget displays static content that doesn't change
/// unless the parent widget rebuilds it with new parameters
class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstrating Stateless & Stateful Widgets',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue.shade100,
            ),
          ),
        ],
      ),
    );
  }
}

/// Stateful Widget Demo - Counter Component
/// This widget maintains internal state and updates the UI
/// when the counter value changes
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  void _decrement() {
    setState(() {
      if (count > 0) count--;
    });
  }

  void _reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Counter (Stateful Widget)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _increment,
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
      ),
    );
  }
}

/// Stateful Widget Demo - Theme Toggler Component
/// Demonstrates changing multiple properties based on state
class ThemeTogglerWidget extends StatefulWidget {
  const ThemeTogglerWidget({super.key});

  @override
  State<ThemeTogglerWidget> createState() => _ThemeTogglerWidgetState();
}

class _ThemeTogglerWidgetState extends State<ThemeTogglerWidget> {
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.grey.shade900 : Colors.grey.shade100;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final iconColor = isDarkMode ? Colors.yellow : Colors.blue;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Theme Toggler (Stateful Widget)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    size: 48,
                    color: iconColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Current theme: ${isDarkMode ? 'Dark' : 'Light'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Switch(
              value: isDarkMode,
              onChanged: (_) => _toggleTheme(),
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleTheme,
              child: Text(isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stateful Widget Demo - Color Changer Component
/// Demonstrates cycling through multiple colors on tap
class ColorChangerWidget extends StatefulWidget {
  const ColorChangerWidget({super.key});

  @override
  State<ColorChangerWidget> createState() => _ColorChangerWidgetState();
}

class _ColorChangerWidgetState extends State<ColorChangerWidget> {
  int colorIndex = 0;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];

  final List<String> colorNames = [
    'Red',
    'Blue',
    'Green',
    'Orange',
    'Purple',
    'Pink',
  ];

  void _changeColor() {
    setState(() {
      colorIndex = (colorIndex + 1) % colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Color Changer (Stateful Widget)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _changeColor,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: colors[colorIndex],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colors[colorIndex].withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.palette,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              colorNames[colorIndex],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors[colorIndex],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tap the circle to change color',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors[colorIndex],
                foregroundColor: Colors.white,
              ),
              child: const Text('Next Color'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stateful Widget Demo - Visibility Toggler Component
/// Demonstrates conditional UI rendering based on state
class VisibilityTogglerWidget extends StatefulWidget {
  const VisibilityTogglerWidget({super.key});

  @override
  State<VisibilityTogglerWidget> createState() => _VisibilityTogglerWidgetState();
}

class _VisibilityTogglerWidgetState extends State<VisibilityTogglerWidget> {
  bool isVisible = true;

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Visibility Toggler (Stateful Widget)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.visibility,
                      size: 40,
                      color: Colors.teal.shade700,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'This content is ${isVisible ? "visible" : "hidden"}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Click the button below to toggle visibility',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.teal.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _toggleVisibility,
              icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
              label: Text(isVisible ? 'Hide' : 'Show'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Main Demo Screen - Combines all widgets
class StatelessStatefulDemoScreen extends StatelessWidget {
  const StatelessStatefulDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless & Stateful Demo'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Static Header (Stateless Widget)
            const HeaderWidget(
              title: 'Interactive Counter App',
            ),
            const SizedBox(height: 24),

            // Interactive Counter (Stateful Widget)
            const CounterWidget(),
            const SizedBox(height: 24),

            // Theme Toggler (Stateful Widget)
            const ThemeTogglerWidget(),
            const SizedBox(height: 24),

            // Color Changer (Stateful Widget)
            const ColorChangerWidget(),
            const SizedBox(height: 24),

            // Visibility Toggler (Stateful Widget)
            const VisibilityTogglerWidget(),
            const SizedBox(height: 24),

            // Info Card (Stateless Widget)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Key Takeaways',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildBulletPoint(
                      '📌 Stateless Widgets',
                      'Display static content that doesn\'t change unless rebuilt by parent.',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      '🔄 Stateful Widgets',
                      'Maintain internal state and rebuild UI when state changes via setState().',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      '⚡ Performance',
                      'Only rebuild affected widgets, not the entire UI.',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      '🎯 Best Practice',
                      'Separate static and reactive parts for better performance.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
