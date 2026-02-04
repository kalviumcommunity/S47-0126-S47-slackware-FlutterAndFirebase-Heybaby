import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/info_card.dart';
import '../widgets/like_button.dart';

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
            CustomButton(
              label: 'Widget Demo',
              onPressed: () {
                Navigator.pushNamed(context, '/demo');
              },
              color: Colors.blue,
            ),
            const SizedBox(height: 12),

            // Second Screen Button
            CustomButton(
              label: 'Second Screen',
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              color: Colors.green,
            ),
            const SizedBox(height: 12),

            // Caregiver Discovery Button
            CustomButton(
              label: 'Find Caregivers',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/discovery',
                  arguments: 'Searching for experienced caregivers',
                );
              },
              color: Colors.purple,
            ),
            const SizedBox(height: 12),

            // Ratings Screen Button
            CustomButton(
              label: 'View Ratings',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/ratings',
                  arguments: {'caregiver': 'Sarah Johnson', 'rating': 4.8},
                );
              },
              color: Colors.orange,
            ),
            const SizedBox(height: 12),

            // User Input Form Button
            CustomButton(
              label: 'User Input Form',
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              color: Colors.teal,
            ),
            const SizedBox(height: 24),

            // Info Section - Using Reusable InfoCard Widget
            const Text(
              'Quick Features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            
            InfoCard(
              title: 'Verified Caregivers',
              subtitle: 'Access background-checked caregivers',
              icon: Icons.verified_user,
              iconColor: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, '/discovery');
              },
            ),
            
            InfoCard(
              title: 'Top Ratings',
              subtitle: 'View 5-star rated caregivers',
              icon: Icons.star,
              iconColor: Colors.amber,
              onTap: () {
                Navigator.pushNamed(context, '/ratings');
              },
            ),
            
            InfoCard(
              title: 'Easy Forms',
              subtitle: 'Simple and secure user input',
              icon: Icons.edit,
              iconColor: Colors.teal,
              onTap: () {
                Navigator.pushNamed(context, '/form');
              },
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
