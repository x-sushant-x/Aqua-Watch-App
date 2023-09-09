import 'package:aqua_watch_app/view/onboarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Called when a marker is clicked on map

class MapScreen extends StatefulWidget {
  const MapScreen();
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng initialLocation = const LatLng(30.27688088312732, 77.04792749406771);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void onTap() {
    // kisi bhi marker ko tap karne pe bottom sheet khulegi
    showModalBottomSheet(
        context: context,
        builder: bottomSheetBuilder,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }

  @override
  void initState() {
    // ye init state or set state wala code copy kiya, ye sab custom marker daalne ke liye hain, samaj nahi aa raha
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(),
            "assets/Person.png") // temporarily yahaan sirf test karne ke liye ye image rakhi hai
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: const MarkerId("marker1"),
          position: const LatLng(30.275164684505096, 77.04757952988390),
          draggable: false,
        ),
        Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(30.275164684505321, 77.04757952988723),
            draggable: false,
            onTap: onTap),
      },
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(),
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

Widget bottomSheetbuilder(BuildContext context) {
  Size deviceSize = MediaQuery.of(context).size;
  return SizedBox(
    height: deviceSize.height / 2,
  );
}
