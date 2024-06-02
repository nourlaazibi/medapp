import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:app_settings/app_settings.dart';
import 'package:medapp/model/doctor.dart';

class MapScreen extends StatefulWidget {
  final List<Doctor> doctors;
  MapScreen({required this.doctors});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class MarkerData {
  final LatLng location;
  final String name;
  final String type;

  MarkerData(this.location, this.name, this.type);
}

class _MapScreenState extends State<MapScreen> {
  List<Doctor> _doctors = [];

  List<MarkerData> _doctorsmarkers = [];
  List<MarkerData> _Busesmarkers = [];
  bool _isLoading = false;
  //Position? _currentPosition;
  double _currentZoom = 10.0;

  // Add a state variable to store location properties
  String _latitude = "";
  String _longitude = "";
  String _altitude = "";

  Future<void> loadDoctors() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final List<MarkerData> marks = widget.doctors.map((doctor) {
        return MarkerData(LatLng(doctor.latitude!, doctor.longitude!),
            doctor.fullName, 'doctor');
      }).toList();

      setState(() {
        _doctors = widget
            .doctors; 
        _doctorsmarkers.clear(); 
        _doctorsmarkers.addAll(marks);
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
   // _requestLocationPermission();
    loadDoctors();
  }

  // Future<void> _requestLocationPermission() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, cannot proceed.
  //       return;
  //     }
  //   }

  //   // Check if location services are enabled.
  //   bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!isLocationServiceEnabled) {
  //     // Location services are not enabled, show an alert dialog or directly open app settings
  //     // For a better user experience, you could first show a dialog explaining why you need them to turn on GPS
  //     // and then lead them to the settings if they agree.
  //     _showLocationServiceDialog();
  //   } else {
  //     _determinePosition();
  //   }
  // }

  void _showLocationServiceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Services de localisation désactivés"),
          content: Text(
              "Veuillez activer les services de localisation pour utiliser cette fonctionnalité."),
          actions: <Widget>[
            TextButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Paramétres"),
              onPressed: () {
                AppSettings.openAppSettings(type: AppSettingsType.location);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<void> _determinePosition() async {
  //   try {
  //     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       // Handle the case where services are disabled (suggest enabling, etc.).
  //       return;
  //     }

  //     _currentPosition = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );

  //     // Update location properties when position is available
  //     if (_currentPosition != null) {
  //       setState(() {
  //         _latitude = _currentPosition!.latitude.toStringAsFixed(4);
  //         _longitude = _currentPosition!.longitude.toStringAsFixed(4);
  //         _altitude = _currentPosition!.altitude.toStringAsFixed(2);
  //       });
  //     }
  //   } catch (e) {
  //     print(e); // Handle any errors
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Doctors"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              loadDoctors();
             // _determinePosition(); // Refresh the doctors when the button is pressed
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(), // Show loading indicator
            )
          : FlutterMap(
              options: MapOptions(
                // Use the current position if available, otherwise use a default location
                initialCenter: LatLng(35.8239, 10.6145),
                initialZoom: _currentZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.bustrackerapp',
                ),
                MarkerLayer(
                  markers: [
                    // Show marker at current position (if available)
                    // if (_currentPosition != null)
                    //   Marker(
                    //     width: 40.0,
                    //     height: 40.0,
                    //     point: LatLng(_currentPosition!.latitude,
                    //         _currentPosition!.longitude),
                    //     child: Icon(Icons.location_pin, color: Colors.red),
                    //   ),
                    // Add additional markers with green color for doctors
                    for (final doctorMarker in _doctorsmarkers)
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: doctorMarker.location,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                doctorMarker.name,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.yellow,
                              padding: EdgeInsets.all(4.0),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.lightGreen,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    // Add additional markers with blue color for buses
                    for (final busMarker in _Busesmarkers)
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: busMarker.location,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                busMarker.name,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.yellow,
                              padding: EdgeInsets.all(4.0),
                            ),
                            Icon(
                              Icons.directions_bus,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentZoom += 1.0;
            // Increase zoom level on tap
          });
        },
        child: Icon(Icons.zoom_in),
      ),
      // Display location properties below the map (optional)

    );
  }
}
