import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.pink), // will be replaced by actual map
          Positioned(
            top: MediaQuery.of(context).size.height / 14,
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
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                        )),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 90,
                                bottom: MediaQuery.of(context).size.height / 90,
                                left: MediaQuery.of(context).size.width / 65,
                                right: MediaQuery.of(context).size.width / 65),
                            child: Text(
                              "Search",
                              style: GoogleFonts.lexend(
                                  fontSize:
                                      MediaQuery.of(context).devicePixelRatio *
                                          12,
                                  color: Color(0xFF898989)),
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
                            size: MediaQuery.of(context).size.height / 28,
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
