import 'package:flutter/material.dart';

/// A reusable info card widget for displaying information in a card format
/// 
/// Benefits:
/// - Consistent card styling across the app
/// - Easy to display various types of information
/// - Reduces repetitive Card + ListTile code
/// - Supports custom icons and styling
/// 
/// Example Usage:
/// ```dart
/// InfoCard(
///   title: 'Profile',
///   subtitle: 'View your account details',
///   icon: Icons.person,
///   onTap: () => Navigator.pushNamed(context, '/profile'),
/// )
/// ```
class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color backgroundColor;

  const InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.iconColor = Colors.teal,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: backgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: iconColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
