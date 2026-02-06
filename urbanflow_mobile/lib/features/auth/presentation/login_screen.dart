import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
              ),
            ),
          ),
          // Ambient Orbs
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00E5FF).withOpacity(0.2),
                blurRadius: 100,
              ),
            ),
          ).animate().scale(duration: 2000.ms, curve: Curves.easeInOut).then().scale(begin: const Offset(1,1), end: const Offset(0.8, 0.8), duration: 2000.ms),
           Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFD946EF).withOpacity(0.2),
                blurRadius: 100,
              ),
            ),
          ),
          
          // Glass Content
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.hub, size: 64, color: Color(0xFF00E5FF))
                          .animate()
                          .fadeIn()
                          .scale(),
                      const SizedBox(height: 24),
                      Text(
                        'UrbanFlow OS',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(),
                      const SizedBox(height: 8),
                      Text(
                        'Infrastructure for the Future',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                      ).animate().fadeIn(delay: 400.ms).slideY(),
                      const SizedBox(height: 48),
                      
                      _LoginButton(
                        label: 'Login as User',
                        icon: Icons.person_outline,
                        onPressed: () => context.go('/map'),
                      ).animate().fadeIn(delay: 600.ms).slideX(),
                      const SizedBox(height: 16),
                      _LoginButton(
                        label: 'Login as Driver',
                        icon: Icons.drive_eta_outlined,
                        color: const Color(0xFFD946EF),
                        onPressed: () => context.go('/map'),
                      ).animate().fadeIn(delay: 800.ms).slideX(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  const _LoginButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? const Color(0xFF00E5FF);
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor.withOpacity(0.5)),
            color: primaryColor.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: primaryColor),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
