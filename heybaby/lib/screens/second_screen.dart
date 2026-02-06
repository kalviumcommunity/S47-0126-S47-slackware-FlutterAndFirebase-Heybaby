import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/like_button.dart';

/// Second Screen - Demonstrates basic navigation
/// 
/// This screen shows:
/// - Receiving data from home screen
/// - Using Navigator.pop() to go back
/// - Passing arguments to previous screen
/// - Simple UI with back button
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade700, Colors.green.shade900],
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
            // Header Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.green.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 48,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'You\'ve Navigated Successfully!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This is the second screen in the navigation flow',
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

            // Navigation Info
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
                      'Navigation Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow('Route', '/second'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Navigation Method', 'pushNamed()'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Back Method', 'Navigator.pop()'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Arguments', 'None passed'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Navigation Stack Info
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
                      'How Navigator Stack Works',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '📚 Stack:\n'
                        '  [Home Screen] ← Base\n'
                        '  [Second Screen] ← Current\n\n'
                        'When you tap "Back to Home",\n'
                        'pop() removes Second Screen\n'
                        'and returns to Home Screen',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Back Button - Using CustomButton Widget
            CustomButton(
              label: 'Back to Home',
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.green,
            ),
            const SizedBox(height: 12),

            // Alternative: Pop until Home - Using CustomButton
            CustomButton(
              label: 'Pop Until Home',
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              color: Colors.teal,
            ),
            const SizedBox(height: 12),

            // Demo Like Button
            Center(
              child: Column(
                children: [
                  const Text(
                    'Try the Like Button Widget:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  LikeButton(
                    onLikeChanged: (isLiked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isLiked ? '❤️ Liked!' : '👎 Unliked',
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
