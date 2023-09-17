import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/checkIn/userSaveLocation.dart';
import '../../state/applicationstate.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;

class CheckInContainer extends StatefulWidget {
  final BuildContext context;
  final UserProfile? user;
  final ApplicationState? appState;

  //const CheckInContainer({super.key});
  const CheckInContainer({required this.context, this.user, this.appState});

  @override
  State<CheckInContainer> createState() => _CheckInContainerState();
}

class _CheckInContainerState extends State<CheckInContainer> {
  bool _isLoadingPhoto = false;
  bool _isLoadingLocation = false;
  GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;
  late Stream<Position> _locationStream;
  late Position _currentPosition;

  void _toggleLoadingPhoto() {
    setState(() {
      _isLoadingPhoto = !_isLoadingPhoto;
    });
  }

  void _toggleLoadingLocation() {
    setState(() {
      _isLoadingLocation = !_isLoadingLocation;
    });
  }

  @override
  void initState() {
    super.initState();

    // Start monitoring location changes when the widget is initialized.
    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    _locationStream = _geolocator.getPositionStream();
    _locationStream.first.then((Position position) {
      // _locationStream.listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _locationStream.first.then((Position value) => null);
    });

    // Also, listen for changes in location services authorization.
    _geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        // Location services are enabled, you can continue tracking.
      } else {
        // Location services are disabled or restricted, handle accordingly.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 39, 61, 111),
        elevation: 8.0,
        margin: EdgeInsets.all(2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        // width: MediaQuery.of(context).size.width - 20,
        //    margin: const EdgeInsets.all(5.0),
        //   color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Check-in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  )),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        elevation: 5,
                      ),
                      onPressed: () async {
                        // await showPopupForm(context);

                        _toggleLoadingLocation();

                        developer.log(
                            '_currentPosition.latitude ${_currentPosition.latitude}');

                        _startLocationUpdates();
                        await saveMobileLocation(
                            context,
                            _currentPosition.latitude,
                            _currentPosition.longitude,
                            //40.74844162658724,
                            //-73.98565918207169,
                            widget.appState!.IsoCountry2List,
                            widget.appState!.currentPlace,
                            widget.appState!.userProfile,
                            widget.appState!.poiList);
                        //   updateStats(widget.appState.userTotals);
                        _toggleLoadingLocation();
                      },
                      child: _isLoadingLocation
                          ? CircularProgressIndicator()
                          : FittedBox(
                              fit: BoxFit.fill,
                              child: Text('Location',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        elevation: 5,
                      ),
                      onPressed: () async {
                        // await showPopupForm(context);

                        _toggleLoadingPhoto();
                        await savePhotoLocation(
                            context,
                            widget.appState!.IsoCountry2List,
                            widget.appState!.currentPlace,
                            widget.appState!.userProfile,
                            widget.appState!.poiList);
                        //   updateStats(widget.appState.userTotals);
                        _toggleLoadingPhoto();
                      },
                      child: _isLoadingPhoto
                          ? CircularProgressIndicator()
                          : FittedBox(
                              fit: BoxFit.fill,
                              child: Text('  Photo  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
