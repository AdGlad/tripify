import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/material.dart';

class Mappage extends StatefulWidget {
  const Mappage({Key? key}) : super(key: key);

  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  late MapShapeSource _shapeSource;
  @override
  void initState() {
    // _shapeSource = MapShapeSource.asset('assets/australia.json',
    _shapeSource = MapShapeSource.asset('assets/world_map.json',
        shapeDataField: 'STATE_NAME');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
        //child: SfMaps(layers: [MapShapeLayer(source: _shapeSource)]),
        child: SfMaps(layers: [
          MapTileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            initialFocalLatLng: MapLatLng(-25, 133),
            initialZoomLevel: 3,
          ),
        ]),
      ),
    );
  }
}
