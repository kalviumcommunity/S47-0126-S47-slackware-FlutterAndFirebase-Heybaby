import 'package:flutter/material.dart';

/// Responsive Design Implementation Screen
///
/// This screen demonstrates:
/// - MediaQuery for dynamic screen dimensions
/// - LayoutBuilder for conditional layouts based on screen size
/// - Combining both for fully responsive UI
/// - Adaptive layouts for mobile and tablet views
///
/// Key Concepts:
/// - Mobile view: Screens < 600px width (Column-based layouts)
/// - Tablet view: Screens >= 600px width (Row-based layouts)
/// - Proportional sizing using percentages instead of fixed dimensions

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Design Demo'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display current screen dimensions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Screen Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Width: ${screenWidth.toStringAsFixed(0)}px',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Height: ${screenHeight.toStringAsFixed(0)}px',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Mode: ${isMobile ? "📱 Mobile" : "📱 Tablet"}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Proportional Sizing Example using MediaQuery
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Proportional Sizing (MediaQuery)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.teal, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '90% of screen width',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '70% of screen width',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.pink, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '50% of screen width',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Adaptive Layout using LayoutBuilder
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Adaptive Layouts (LayoutBuilder)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        // Mobile Layout - Vertical stacking
                        return Column(
                          children: [
                            _buildAdaptiveCard(
                              title: 'Mobile Layout',
                              subtitle: 'Vertical stacking for small screens',
                              icon: Icons.phone_android,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 12),
                            _buildAdaptiveCard(
                              title: 'Single Column',
                              subtitle: 'Cards stack on top of each other',
                              icon: Icons.vertical_align_top,
                              color: Colors.indigo,
                            ),
                            const SizedBox(height: 12),
                            _buildAdaptiveCard(
                              title: 'Touch-Friendly',
                              subtitle: 'Larger touch targets for fingers',
                              icon: Icons.touch_app,
                              color: Colors.purple,
                            ),
                          ],
                        );
                      } else {
                        // Tablet Layout - Horizontal arrangement
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.45,
                                  child: _buildAdaptiveCard(
                                    title: 'Tablet Layout',
                                    subtitle: 'Horizontal arrangement',
                                    icon: Icons.tablet,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.45,
                                  child: _buildAdaptiveCard(
                                    title: 'Two Columns',
                                    subtitle: 'Side-by-side arrangement',
                                    icon: Icons.view_agenda,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildAdaptiveCard(
                              title: 'Full-Width Panel',
                              subtitle: 'Uses entire available width',
                              icon: Icons.fullscreen,
                              color: Colors.purple,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Responsive Grid Example
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Responsive Grid Layout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate number of columns based on screen width
                      final isTablet = constraints.maxWidth >= 600;
                      final crossAxisCount = isTablet ? 3 : 2;
                      final itemWidth =
                          (constraints.maxWidth - 12) / crossAxisCount;

                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          6,
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.primaries[index % Colors.primaries.length]
                                  .shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.primaries[index % Colors.primaries.length],
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.featured_play_list,
                                    color: Colors.primaries[
                                        index % Colors.primaries.length],
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Item ${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Responsive Padding/Spacing Example
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Responsive Spacing',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Padding: 5% of screen width',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This container has padding that scales with the screen width. On mobile, padding will be smaller. On tablets, it will be larger.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildAdaptiveCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
