import 'package:flutter/material.dart';

/// A reusable stateful like button widget
/// 
/// Benefits:
/// - Manages its own state independently
/// - Can be reused across multiple screens
/// - Consistent visual feedback for user interactions
/// - Clean separation of like button logic
/// 
/// Example Usage:
/// ```dart
/// LikeButton(
///   onLikeChanged: (isLiked) {
///     print('Like status: $isLiked');
///   },
/// )
/// ```
class LikeButton extends StatefulWidget {
  final Function(bool)? onLikeChanged;
  final bool initialLikeState;

  const LikeButton({
    this.onLikeChanged,
    this.initialLikeState = false,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.initialLikeState;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Colors.red : Colors.grey,
        size: 28,
      ),
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
        if (widget.onLikeChanged != null) {
          widget.onLikeChanged!(_isLiked);
        }
      },
    );
  }
}
