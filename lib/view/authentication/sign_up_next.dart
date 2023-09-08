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
              color: Colors.black,
            ),]),

            Container(padding: EdgeInsets.only(right: w*0.1,left: w*0.1),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text("Pick 5 places where you visit frequently!",
                    style:  GoogleFonts.lexend(textStyle: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500))),
                Column(children: [
                  Container(height: h*0.6,width: w*0.85,

                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(suffixIcon: Image(
                            image: AssetImage("assets/signup/Location.png"),
                            width: 10,height: 10,

                          ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location One',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(suffixIcon: Image(
                            image: AssetImage("assets/signup/Location.png"),
                            width: 10,height: 10,

                          ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Two',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(suffixIcon: Image(
                            image: AssetImage("assets/signup/Location.png"),
                            width: 10,height: 10,

                          ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Three',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(suffixIcon: Image(
                            image: AssetImage("assets/signup/Location.png"),
                            width: 10,height: 10,

                          ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: 'Location Four',
                          ),style: GoogleFonts.lexend(),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(suffixIcon: Image(
                            image: AssetImage("assets/signup/Location.png"),
                            width: 10,height: 10,

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
                            backgroundColor: Colors.black, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                          child:
                              Text(
                                "Continue",
                                style: GoogleFonts.lexend(
                                  textStyle: TextStyle(fontSize: 15, color: Colors.white),
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
                      style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,color: Colors.black)),),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );

                      }, child: Text("Login",style: GoogleFonts.lexend(
                          textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),))],
                  ),),
                )


              ],),
            )],
        )
    );
  }
}