import 'package:aqua_watch_app/controllers/map_controller.dart';
import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/map/map_point.dart';

class MapScreen extends StatelessWidget {
  final LatLng initialLocation;
  final List<MapPoint> pointList;

  const MapScreen({required this.initialLocation, required this.pointList});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MapController());

    // I have put this inside parent build method because this requires context to be passed
    // which is availble in this build method
    Widget mapBottomSheetBuilder(BuildContext context) {
      Size deviceSize = MediaQuery.of(context).size;
      return SizedBox(
        height: deviceSize.height / 2.4,
        child: Padding(
          padding: EdgeInsets.all(deviceSize.width / 40),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12), // Adjust border radius as needed
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Light shadow color
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12), // Match the border radius
                  child: Image.network(
                    controller.selectedMapPoint.imageUrl,
                    width: double.infinity, // Set to fill width
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: deviceSize.height / 30),
              RiskWidget(
                  deviceSize,
                  controller.selectedMapPoint.damageScore > 100
                      ? 'HIGH'
                      : 'LOW',
                  controller.selectedMapPoint.damageScore < 100
                      ? Colors.deepOrangeAccent.shade700
                      : Colors.redAccent.shade700)
            ],
          ),
        ),
      );
    }

    return GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 14,
      ),
      markers: pointList
          .map(
              // e is a MapPoint type
              (e) => Marker(
                  // using image url as unique marker id
                  markerId: MarkerId(e.imageUrl),
                  position: LatLng(e.coordinates[0], e.coordinates[1]),
                  icon: e.damageScore > 100
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed)
                      : BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                  onTap: () {
                    controller.selectedMapPoint = e;
                    showModalBottomSheet(
                        context: context,
                        builder: mapBottomSheetBuilder,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))));
                  },
                  draggable: false))
          .toSet(),
    );
  }

  Row RiskWidget(Size deviceSize, String title, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Risk on place:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: deviceSize.width / 10),
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          width: deviceSize.width / 5,
          height: deviceSize.height / 20,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var controller = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: controller.getMapPoints(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No points available'));
                } else {
                  return MapScreen(
                    // First MapPointer returned is treated as initial location (centre location)
                    initialLocation: LatLng(snapshot.data![0].coordinates[0],
                        snapshot.data![0].coordinates[1]),
                    pointList: snapshot.data!,
                  );
                }
              }),
          Positioned(
            top: MediaQuery.of(context).size.height / 25,
            left: MediaQuery.of(context).size.width / 6.5,
            right: MediaQuery.of(context).size.width / 6.5,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF898989), width: 1)),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height / 400),
                          bottom: (MediaQuery.of(context).size.height / 400),
                          left: MediaQuery.of(context).size.width / 10000,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: MediaQuery.of(context).size.height / 34,
                          ),
                        )),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 90,
                                bottom: MediaQuery.of(context).size.height / 90,
                                left: MediaQuery.of(context).size.width / 65,
                                right: MediaQuery.of(context).size.width / 65),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Search",
                                style: GoogleFonts.lexend(
                                    fontSize: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        7,
                                    color: Color(0xFF898989)),
                              ),
                            ))),
                    Padding(
                        padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height / 400),
                          bottom: (MediaQuery.of(context).size.height / 400),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            size: MediaQuery.of(context).size.height / 34,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
