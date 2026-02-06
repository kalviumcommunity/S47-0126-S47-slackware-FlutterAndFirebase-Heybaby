import 'package:flutter/material.dart';

/// Flutter Animations & Transitions Demo Screen
///
/// This screen demonstrates:
/// - Implicit animations (AnimatedContainer, AnimatedOpacity)
/// - Explicit animations (AnimationController, Transitions)
/// - Page transitions with custom animations
/// - Animation best practices
///
/// Key Concepts:
/// - Implicit: Flutter handles animation automatically (easy)
/// - Explicit: Manual control with AnimationController (flexible)
/// - Curves: Define animation timing (easeInOut, bounceIn, etc.)
/// - Duration: Control animation speed (< 800ms for responsiveness)

class AnimationsTransitionsDemo extends StatefulWidget {
  const AnimationsTransitionsDemo({super.key});

  @override
  State<AnimationsTransitionsDemo> createState() =>
      _AnimationsTransitionsDemoState();
}

class _AnimationsTransitionsDemoState extends State<AnimationsTransitionsDemo>
    with SingleTickerProviderStateMixin {
  bool _toggledContainer = false;
  bool _toggledOpacity = false;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations & Transitions'),
        backgroundColor: Colors.indigo.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Introduction Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade50, Colors.indigo.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.animation,
                      size: 40,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Animation Types',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Implicit: Automatic animations\nExplicit: Manual control',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Implicit Animation 1: AnimatedContainer
            _buildSectionHeader('Implicit: AnimatedContainer'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Column(
                children: [
                  AnimatedContainer(
                    width: _toggledContainer ? 200 : 100,
                    height: _toggledContainer ? 100 : 200,
                    color: _toggledContainer ? Colors.teal : Colors.orange,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Center(
                      child: Text(
                        'Tap Below!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _toggledContainer = !_toggledContainer;
                      });
                    },
                    icon: const Icon(Icons.animation),
                    label: Text(_toggledContainer ? 'Toggle Back' : 'Toggle'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Changes size and color smoothly with animation',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Implicit Animation 2: AnimatedOpacity
            _buildSectionHeader('Implicit: AnimatedOpacity'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: _toggledOpacity ? 1.0 : 0.3,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _toggledOpacity = !_toggledOpacity;
                      });
                    },
                    icon: const Icon(Icons.visibility),
                    label: Text(_toggledOpacity ? 'Fade Out' : 'Fade In'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Gradually fades in and out smoothly',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Explicit Animation: RotationTransition
            _buildSectionHeader('Explicit: RotationTransition'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: Column(
                children: [
                  RotationTransition(
                    turns: _rotationController,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_rotationController.isAnimating) {
                        _rotationController.stop();
                      } else {
                        _rotationController.repeat(reverse: true);
                      }
                      setState(() {});
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: Text(_rotationController.isAnimating ? 'Stop' : 'Start'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Continuously rotates using AnimationController',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Page Transition Example
            _buildSectionHeader('Page Transitions'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      _navigateWithSlideTransition(context);
                    },
                    icon: const Icon(Icons.navigation),
                    label: const Text('Slide Transition'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Navigate to next page with slide animation',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Animation Best Practices
            _buildSectionHeader('Best Practices'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.cyan.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.cyan, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBestPracticeItem(
                    '⏱️',
                    'Duration: 300-800ms',
                    'Keep animations quick for responsiveness',
                  ),
                  const SizedBox(height: 12),
                  _buildBestPracticeItem(
                    '🎯',
                    'Purposeful Motion',
                    'Guide attention, not distract users',
                  ),
                  const SizedBox(height: 12),
                  _buildBestPracticeItem(
                    '📈',
                    'Use easeInOut Curves',
                    'Create natural, smooth transitions',
                  ),
                  const SizedBox(height: 12),
                  _buildBestPracticeItem(
                    '🧪',
                    'Test Performance',
                    'Verify smoothness on various devices',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }

  Widget _buildBestPracticeItem(
    String icon,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateWithSlideTransition(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AnimationDetailPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        },
      ),
    );
  }
}

/// Detail page for animation transition example
class AnimationDetailPage extends StatelessWidget {
  const AnimationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Page'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Slide Transition Complete!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'This page was animated using PageRouteBuilder',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
