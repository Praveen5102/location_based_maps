import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'map_screen.dart';

class LocationInputScreen extends StatefulWidget {
  @override
  _LocationInputScreenState createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  final TextEditingController _controller = TextEditingController();
  String _errorText = '';

  void _goToMapScreen(String location) async {
    if (location.isEmpty) {
      setState(() {
        _errorText = 'Location cannot be empty';
      });
      return;
    }

    try {
      List<Location> locations = await locationFromAddress(location);
      if (locations.isNotEmpty) {
        final selectedLocation = locations.first;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MapScreen(
              latitude: selectedLocation.latitude,
              longitude: selectedLocation.longitude,
              locationName: location,
            ),
          ),
        );
      } else {
        setState(() {
          _errorText = 'Location not found';
        });
      }
    } catch (e) {
      setState(() {
        _errorText = 'Error: Unable to find location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Enter Location'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter a city name or address to view on the map:',
              style: TextStyle(fontSize: 18, color: Colors.blue[900]),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Location',
                hintText: 'e.g., New York, Paris',
                errorText: _errorText.isEmpty ? null : _errorText,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToMapScreen(_controller.text),
              child: Text('Show on Map'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
