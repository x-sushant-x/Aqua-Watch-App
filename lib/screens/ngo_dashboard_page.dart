import 'package:aqua_watch_app/controllers/ngo_dashboard/ngo_dashboard_controller.dart';
import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This function appropriately shows compact details of problems when the respective button is clicked
// ////////////////////// 
///////////////////////
// During  API integration, this function would remain as it is (because it render widgets according to selected button), 
// but with individualData being loaded from API
///////////////////////////////
////////////////////////////////
////// individualData is a list of Map
/* Data is in this form:
  {"color": Color,
  "name": String,
  "description": String,
  "image": ImageProvider,
  }
  */
Widget appropriateCompactDetails(RxString menuName) {
  if (menuName.value == "numOfProblems") {return CompactDashBoardDetails(title: "Damage Areas", seeAllAction: () {}, individualIcon: Icons.location_on_outlined, individualIconAction: () {},
        individualData: const [{"color": Colors.red, "name": "Mahesh-Nagar", "description": "Mahesh-Nagar, Ambala Cantt, Haryana", "image": NetworkImage("https://media.istockphoto.com/id/1327617934/photo/aerial-view-of-flooded-houses-with-dirty-water-of-dnister-river-in-halych-town-western-ukraine.jpg?s=1024x1024&w=is&k=20&c=h7MIcry_d_Ek_wpuj5OCS9tHBlvJzNGYZKIBJOv_brk=")}],);}
  else if (menuName.value == "numOfAffectedPeople") {
    return CompactDashBoardDetails(title: "People Affected", seeAllAction: () {}, individualIcon: Icons.phone, individualIconAction: () {},
        individualData: const [{"color": Colors.red, "name": "Binod Kumar", "description": "Mahesh-Nagar, Ambala Cantt, Haryana", "image": AssetImage("assets/dashboard_person.png")}],);}
  else if (menuName.value == "numOfNGOs") {
    return CompactDashBoardDetails(title: "NGO's Active", seeAllAction: () {}, individualIcon: Icons.arrow_forward_ios, individualIconAction: () {},
        individualData: const [{"color": Colors.red, "name": "Binod Kumar", "description": "Mahesh-Nagar, Ambala Cantt, Haryana", "image": AssetImage("assets/dashboard_ngo.png")}],);}
        else {
          return CompactDashBoardDetails(title: "Clean Water Issues", seeAllAction: () {}, individualIcon: Icons.location_on_outlined, individualIconAction: () {},
        individualData: const [{"color": Colors.red, "name": "Drainage", "description": "Mahesh-Nagar, Ambala Cantt, Haryana", "image": NetworkImage("https://media.istockphoto.com/id/1327617934/photo/aerial-view-of-flooded-houses-with-dirty-water-of-dnister-river-in-halych-town-western-ukraine.jpg?s=1024x1024&w=is&k=20&c=h7MIcry_d_Ek_wpuj5OCS9tHBlvJzNGYZKIBJOv_brk=")}],);}
        
}

class CompactDashBoardDetails extends StatefulWidget {
  final String title;
  final Function() seeAllAction; // Executed when "See All" is pressed

  /* Data is in this form:
  {"color": Color,
  "name": String,
  "description": String,
  "image": Image,
  }
  */
  
  final List<Map<String, dynamic>> individualData; 
  
  // Icon shown at the end of individual tile
  final IconData individualIcon;
  final Function() individualIconAction;

  const CompactDashBoardDetails({required this.title, required this.seeAllAction, required this.individualData, required this.individualIcon, required this.individualIconAction});

  @override
  State<CompactDashBoardDetails> createState() => _CompactDashBoardDetailsState();
}

class _CompactDashBoardDetailsState extends State<CompactDashBoardDetails> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.sizeOf(context);
    List<ListTile> tiles = [];
    List<Widget> childrenOfColumn = [];

    for (Map<String, dynamic> i in widget.individualData) {
      tiles.add(ListTile(

        onTap: widget.individualIconAction,
        
        visualDensity: VisualDensity.standard,
        titleTextStyle: GoogleFonts.lexend(fontSize: 20, color: AppColors.black,),
        subtitleTextStyle: GoogleFonts.lexend(fontSize: 12, color: AppColors.black),
        
        
        leading:
      ConstrainedBox(
        constraints: BoxConstraints.loose(Size(70, double.infinity)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
        Container(width: 7, decoration: BoxDecoration(color: i["color"], borderRadius: BorderRadius.all(Radius.circular(6))),),
        SizedBox(width: 10,),
        IntrinsicHeight(child: SizedBox(width: 50, child: Image(image: i["image"], fit: BoxFit.fill,)),)
        
        ]
        ),
      ),
       title: Text(i["name"]), subtitle: Text(i["description"]), trailing: Icon(widget.individualIcon, size: 30,),));
    }

    childrenOfColumn.add(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w500),),
            TextButton(onPressed: widget.seeAllAction, child: Text("See All", style: TextStyle(color: Color(0xFF848181)),))
          ],
        ),
      )
    );

    childrenOfColumn.add(SizedBox(height: deviceSize.height/80,));

    childrenOfColumn.addAll(tiles);

    return Column(
      
      children: childrenOfColumn
    );
  }
}
class DashboardInformationBox extends StatefulWidget {
  final String menuName;
  final String description;
  final String value;

  const DashboardInformationBox({required this.description, required this.value, required this.menuName});

  @override
  State<DashboardInformationBox> createState() => _DashboardInformationBoxState();
}

class _DashboardInformationBoxState extends State<DashboardInformationBox> {
  bool selected = false;
  var ngoDashBoardController = Get.put(NGODashboardController());

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.sizeOf(context);
    
    return Obx(() => InkWell(onTap: () {ngoDashBoardController.menuSelected.value = widget.menuName;}, child: Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 6, blurStyle: BlurStyle.outer,)],
        color: (ngoDashBoardController.menuSelected.value == widget.menuName) ? Color(0xFF3C3C3C) : AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        
      ),
      width: 153/360 * deviceSize.width,
      height: 120/800 * deviceSize.height,
      child: Padding(
        padding: EdgeInsets.only(left: 12, top: 14),
        child: Text.rich(
              TextSpan(
                children: [TextSpan(text: "${widget.value}\n", style: TextStyle(fontSize: 30)),TextSpan(text: widget.description)],
              style: TextStyle(color: (ngoDashBoardController.menuSelected.value == widget.menuName) ? AppColors.white : AppColors.black
              , fontSize: 15, height: 1.9),
              
              ),
      )
          )
        
      )
    ));
  }
}

class NGODashboardPage extends StatefulWidget {
  @override
  State<NGODashboardPage> createState() => _NGODashboardPageState();
}

class _NGODashboardPageState extends State<NGODashboardPage> {
  var ngoDashBoardController = Get.put(NGODashboardController());
  String selectedPage = "problems";
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Stack(
        
          
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: 
              Container(height: 279/(800-67) * deviceSize.height, width: deviceSize.width,
              decoration: 
              BoxDecoration(shape: BoxShape.rectangle, color: AppColors.black, borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),),
            ),
            SafeArea(child: 
            Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Obx( () => Column(
                    
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column( children: [
                        SafeArea(child: Align( alignment: Alignment.centerLeft, child: Text("Dashboard", style: GoogleFonts.lexend(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.left,))),
                        SizedBox(height: 38/800 * deviceSize.height,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            DashboardInformationBox(description: "Problems in Area", value: "10", menuName: "numOfProblems",),
                            DashboardInformationBox(description: "People Affected", value: "700", menuName: "numOfAffectedPeople")
                          ],
                        ),
                        SizedBox(height: 15/800 * deviceSize.height,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            DashboardInformationBox(description: "NGOs Active", value: "12", menuName: "numOfNGOs"),
                            DashboardInformationBox(description: "Clean Water Issues", value: "23", menuName: "numOfCleanWaterIssues")
                          ],
                        ),
                        SizedBox(height: 70/800 * deviceSize.height,),
                        ]),
                      ),

                      appropriateCompactDetails(ngoDashBoardController.menuSelected)

                    ],
                  )),
                ),
              
            )
          ],
        ),
    );
  }
}