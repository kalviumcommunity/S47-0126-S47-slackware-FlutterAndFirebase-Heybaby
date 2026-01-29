import 'package:flutter/material.dart';

/// Caregiver Discovery Screen
/// 
/// Demonstrates:
/// - Receiving arguments from navigation
/// - Displaying dynamic content based on arguments
/// - Theme-specific screen for the HeyBaby app
class CaregiverDiscoveryScreen extends StatefulWidget {
  final String message;

  const CaregiverDiscoveryScreen({
    required this.message,
    super.key,
  });

  @override
  State<CaregiverDiscoveryScreen> createState() =>
      _CaregiverDiscoveryScreenState();
}

class _CaregiverDiscoveryScreenState extends State<CaregiverDiscoveryScreen> {
  final List<Map<String, dynamic>> caregivers = [
    {
      'name': 'Sarah Johnson',
      'rating': 4.8,
      'reviews': 127,
      'icon': Icons.person,
      'color': Colors.pink,
      'verified': true,
    },
    {
      'name': 'Emily Watson',
      'rating': 4.9,
      'reviews': 156,
      'icon': Icons.person,
      'color': Colors.blue,
      'verified': true,
    },
    {
      'name': 'Jessica Lee',
      'rating': 4.7,
      'reviews': 98,
      'icon': Icons.person,
      'color': Colors.purple,
      'verified': true,
    },
    {
      'name': 'Amanda Brown',
      'rating': 4.6,
      'reviews': 84,
      'icon': Icons.person,
      'color': Colors.teal,
      'verified': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Caregivers'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade700, Colors.purple.shade900],
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
            // Arguments Display
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade50, Colors.purple.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.person_search,
                      size: 48,
                      color: Colors.purple,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Caregiver Discovery',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Caregivers List
            const Text(
              'Verified Caregivers Near You',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...caregivers.map((caregiver) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCaregiverCard(caregiver),
              );
            }).toList(),
            const SizedBox(height: 24),

            // Navigation Back
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCaregiverCard(Map<String, dynamic> caregiver) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: caregiver['color'] as Color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: (caregiver['color'] as Color).withOpacity(0.3),
                    child: Icon(
                      Icons.person,
                      color: caregiver['color'],
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              caregiver['name'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (caregiver['verified'] as bool)
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              '${caregiver['rating']} (${caregiver['reviews']} reviews)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Booking request sent to ${caregiver['name']}!',
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: caregiver['color'] as Color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    child: const Text('Book', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
