import 'package:aqua_watch_app/view/authentication/log_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sign_up_next extends StatefulWidget {
  const sign_up_next({Key? key}) : super(key: key);

  @override
  State<sign_up_next> createState() => _sign_up_nextState();
}

class _sign_up_nextState extends State<sign_up_next> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(elevation: 0,
            backgroundColor: Color(0xfff6f6f6)),
        backgroundColor:  Color(0xfff6f6f6),
        body: Stack(
          children: [Column(mainAxisAlignment: MainAxisAlignment.end,children: [
            Container(height: h*0.3,
              width: w,
              color: Color.fromARGB(255, 66, 66, 66),
            ),]),

            Container(padding: EdgeInsets.only(right: w*0.1,left: w*0.1),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Wrap(
                  children: [
                    Text("Pick 5 places where you visit frequently!",
                        style:  GoogleFonts.lexend(textStyle:
                        TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 24,fontWeight: FontWeight.w500))),
                  ],
                ),
                Column(children: [
                  Container(
                    height: h * 0.6,
                    width: w * 0.90,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1.0, color: Colors.grey.shade500),
                      ],
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(suffixIcon: Icon(
                            Icons.location_on,
                            color: Colors.grey.shade600,
                          ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location One',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.location_on,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Two',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.location_on,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Three',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.location_on,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Four',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.location_on,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Five',
                          ),style: GoogleFonts.lexend(),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            // Add your Google sign-up logic here
                          },
                          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(h*0.07),
                            backgroundColor: Color.fromARGB(
                                255, 37, 37, 37), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                          child:
                              Text(
                                "Continue",
                                style: GoogleFonts.lexend(
                                  textStyle: TextStyle(fontSize: 13, color: Colors.white),
                                ),
                              )
                        )
                      ],
                    ),

                  ),
                ],
                ),
                Container(height: h*0.08,width: w*0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  ),
                  child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("Already have account?",
                      style: GoogleFonts.lexend(textStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 69, 69, 69))),),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );

                      }, child: Text("Login",style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color:
                              Color.fromARGB(255, 0, 0, 0))),))],
                  ),),
                )


              ],),
            )],
        )
    );
  }
}