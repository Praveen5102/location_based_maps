import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String locationName;

  const MapScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.locationName,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  LatLng? _currentPosition;
  LatLng? _userLocation;
  String _mapType = 'street';

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _currentPosition = LatLng(widget.latitude, widget.longitude);
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permissions are permanently denied')),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
      _mapController.move(_userLocation!, 15.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.locationName),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_mapType == 'street' ? Icons.satellite : Icons.map),
            onPressed: () {
              setState(() {
                _mapType = _mapType == 'street' ? 'satellite' : 'street';
              });
            },
          ),
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _currentPosition!,
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: _mapType == 'street'
                ? 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
                : 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              // Red marker for the initial position
              Marker(
                point: _currentPosition!,
                width: 80.0,
                height: 80.0,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              // Blue marker for the user's current location (if available)
              if (_userLocation != null)
                Marker(
                  point: _userLocation!,
                  width: 80.0,
                  height: 80.0,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.my_location),
        backgroundColor: Colors.blue,
      ),
    );
  }
}