import 'package:flutter/material.dart';

/// Home Screen - Main navigation hub for the app
/// 
/// This screen serves as the entry point and provides navigation
/// to different sections of the app using named routes.
/// 
/// Demonstrates:
/// - Navigator.pushNamed() for navigation
/// - Navigation with arguments
/// - UI layout with multiple action buttons
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeyBaby - Childcare Discovery'),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Header
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.blue.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.home,
                      size: 48,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome to HeyBaby',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Find trusted caregivers with verified backgrounds and ratings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Navigation Buttons
            const Text(
              'Navigate to Different Sections',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Stateless & Stateful Demo Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/demo');
              },
              icon: const Icon(Icons.widgets),
              label: const Text('Widget Demo'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Second Screen Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Second Screen'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Caregiver Discovery Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/discovery',
                  arguments: 'Searching for experienced caregivers',
                );
              },
              icon: const Icon(Icons.person_search),
              label: const Text('Find Caregivers'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Ratings Screen Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/ratings',
                  arguments: {'caregiver': 'Sarah Johnson', 'rating': 4.8},
                );
              },
              icon: const Icon(Icons.star),
              label: const Text('View Ratings'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),

            // Info Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Navigation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoPoint(
                      '📍',
                      'Named Routes',
                      'Use pushNamed() to navigate to predefined routes',
                    ),
                    const SizedBox(height: 10),
                    _buildInfoPoint(
                      '📤',
                      'Pass Arguments',
                      'Send data between screens using arguments parameter',
                    ),
                    const SizedBox(height: 10),
                    _buildInfoPoint(
                      '⬅️',
                      'Back Navigation',
                      'Use pop() to return to the previous screen',
                    ),
                    const SizedBox(height: 10),
                    _buildInfoPoint(
                      '📚',
                      'Stack Management',
                      'Navigator maintains a stack of screens for easy navigation',
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

  Widget _buildInfoPoint(String icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
