import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Bangalore Coordinates as default
  final LatLng _initialCenter = const LatLng(12.9716, 77.5946);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _initialCenter,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.urbanflow',
                // Attribution is required for CartoDB
              ),
              // TODO: Add Vehicle Markers Layer
              // TODO: Add Route Polylines Layer
            ],
          ),
          
          // Floating Search Bar
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white70),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Where to?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00E5FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, size: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Panel
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MapActionButton(
                  icon: Icons.directions_bus,
                  label: 'Transit',
                  onTap: () {},
                ),
                 _MapActionButton(
                  icon: Icons.local_taxi,
                  label: 'Ride',
                  isActive: true, // Default active
                  onTap: () {},
                ),
                 _MapActionButton(
                  icon: Icons.work,
                  label: 'Jobs',
                  onTap: () {},
                ),
                _MapActionButton(
                  icon: Icons.local_offer,
                  label: 'Ads',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _MapActionButton({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
             color: isActive ? const Color(0xFF00E5FF) : const Color(0xFF1E293B),
             shape: BoxShape.circle,
             boxShadow: [
               if (isActive) 
                 BoxShadow(color: const Color(0xFF00E5FF).withOpacity(0.4), blurRadius: 12, spreadRadius: 2)
             ]
          ),
          child: Icon(
            icon, 
            color: isActive ? Colors.black : Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF00E5FF) : Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
