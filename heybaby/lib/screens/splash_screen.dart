import 'package:flutter/material.dart';

/// SplashScreen: Shows a loading screen while Firebase checks session persistence
///
/// This screen is displayed when the app first opens and Firebase is checking
/// if the user has an existing persistent login session.
///
/// UX Benefits:
/// - Professional appearance during initial load
/// - Clear feedback that app is working
/// - Prevents UI flicker between screens
/// - Time for Firebase to restore session tokens
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade700,
              Colors.pink.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo / Icon
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(25),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.people_alt,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              // App Name
              const Text(
                'HeyBaby',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Tagline
              Text(
                'Find Trusted Caregivers',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withAlpha(200),
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 48),

              // Loading Indicator
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 24),

              // Loading Text
              Text(
                'Checking your session...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(180),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
