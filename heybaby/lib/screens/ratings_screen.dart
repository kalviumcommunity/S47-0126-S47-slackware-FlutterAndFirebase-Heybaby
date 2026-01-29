import 'package:flutter/material.dart';

/// Ratings & Reviews Screen
/// 
/// Demonstrates:
/// - Receiving complex arguments (Map)
/// - Conditional rendering based on arguments
/// - Displaying ratings and reviews information
class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments from navigation
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final caregiverName = arguments?['caregiver'] as String? ?? 'Unknown';
    final rating = arguments?['rating'] as double? ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings & Reviews'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade700, Colors.orange.shade900],
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
            // Header with Caregiver Info
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade50, Colors.orange.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 48,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      caregiverName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRatingDisplay(rating),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '⭐ Highly Rated Caregiver',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Argument Information
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
                      'Received Arguments',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildArgumentRow('Type', 'Map<String, dynamic>'),
                    const SizedBox(height: 10),
                    _buildArgumentRow('Key: caregiver', caregiverName),
                    const SizedBox(height: 10),
                    _buildArgumentRow('Key: rating', '$rating'),
                    const SizedBox(height: 10),
                    _buildArgumentRow(
                      'Navigation Route',
                      '/ratings',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sample Reviews
            const Text(
              'Recent Reviews',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildSampleReviews(),
            const SizedBox(height: 24),

            // Navigation Buttons
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Navigate to Discovery
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/discovery',
                  arguments: 'Find more caregivers',
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Find Other Caregivers'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.orange,
                side: const BorderSide(color: Colors.orange),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingDisplay(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rating.toString(),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < rating.toInt() ? Colors.amber : Colors.grey,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '(287 reviews)',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArgumentRow(String label, String value) {
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
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.orange.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSampleReviews() {
    final reviews = [
      {
        'author': 'Jessica M.',
        'rating': 5,
        'date': '2 weeks ago',
        'text': 'Excellent caregiver! Very responsible and caring with my kids.',
      },
      {
        'author': 'Michael T.',
        'rating': 5,
        'date': '1 month ago',
        'text': 'Highly recommended! Professional and trustworthy.',
      },
      {
        'author': 'Lisa P.',
        'rating': 4,
        'date': '2 months ago',
        'text': 'Great experience. Very reliable and flexible with schedules.',
      },
    ];

    return reviews.map((review) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review['author'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: List.generate(
                        review['rating'] as int,
                        (_) => const Icon(Icons.star, size: 14, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  review['text'] as String,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  review['date'] as String,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
