import 'package:flutter/material.dart';

/// A reusable, customizable button widget
/// 
/// Benefits:
/// - Consistent styling across the app
/// - Easy to modify button appearance in one place
/// - Supports different colors, sizes, and actions
/// - Reduces code duplication
/// 
/// Example Usage:
/// ```dart
/// CustomButton(
///   label: 'Submit',
///   onPressed: () => Navigator.pushNamed(context, '/home'),
///   color: Colors.teal,
/// )
/// ```
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double padding;

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.color = Colors.teal,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.padding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
