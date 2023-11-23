import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/buttons.dart';

class PostCard extends StatefulWidget {
  final String avatarImageUrl;
  final String name;
  final String date;
  final String imageUrl;
  final String caption;
  final int likeCount;
  final int damageCount;

  const PostCard({
    required this.avatarImageUrl,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.caption,
    required this.likeCount,
    required this.damageCount,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.6),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenSize.width / 29),
                    child: CircleAvatar(
                      backgroundColor: AppColors.grey,
                      radius: screenSize.width * 0.04,
                      child: Image.asset(
                        'assets/app icon.png',
                        width: screenSize.width * 0.1,
                        height: screenSize.width * 0.1,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                        // TextSpan(
                        //   text: '  ${widget.date}',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.normal,
                        //     fontSize: 14,
                        //     color: AppColors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(widget.date),
                  ),
                ],
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade700,
                  size: 22,
                ),
              ),
            ],
          ),
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: screenSize.width * 0.8,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.caption,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: AppColors.black,
                      height: 1.4),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.width / 30),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: AppColors.grey,
                  size: 20,
                ),
                SizedBox(width: screenSize.width / 50),
                Text(
                  '${widget.likeCount}',
                  style: TextStyle(color: AppColors.grey, fontSize: 14),
                ),
                SizedBox(width: screenSize.width / 20),
                Text(
                  'Damage : ${widget.damageCount}',
                  style: TextStyle(color: AppColors.grey, fontSize: 15),
                ),
                Spacer(),
                Image.asset('assets/Navigation.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  void _showUploadModal(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle tap to upload action
                },
                child: Container(
                  height: deviceSize.height / 3,
                  width: deviceSize.width / 0.5,
                  margin: EdgeInsets.symmetric(
                      horizontal: deviceSize.width / 50,
                      vertical: deviceSize.height / 70),
                  decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Upload File.png',
                        height: 50.0, // Adjust the height as needed
                      ),
                      SizedBox(
                          height: 16.0), // Add spacing between image and text
                      Center(
                        child: Text(
                          'Tap to Upload',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width / 50,
                        vertical: deviceSize.height / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: AppColors.grey, width: 1.0),
                      ),
                      width: deviceSize.width / 0.5,
                      height: deviceSize.height / 18,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceSize.width / 28,
                            vertical: deviceSize.height / 700),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Describe Issue',
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).devicePixelRatio *
                                        6.5),
                            border: InputBorder.none, // Remove the border line
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.width / 50,
                        right: deviceSize.width / 50,
                        top: deviceSize.height / 45),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Issue Type',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).devicePixelRatio * 7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: deviceSize.height / 40,
                        bottom: 0,
                        left: deviceSize.width / 120,
                        right: deviceSize.width / 120),
                    child: Row(
                      children: [
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Flood",
                            onTap: () {}),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Clean Water",
                            onTap: () {}),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Draingae",
                            onTap: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: deviceSize.height / 6000,
                        horizontal: deviceSize.width / 120),
                    child: Row(
                      children: [
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Ponds",
                            onTap: () {}),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Other",
                            onTap: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.width / 50,
                        top: deviceSize.height / 40),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the upload action
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Set circular radius to 5
                            ),
                            minimumSize: Size(
                                deviceSize.width / 20, deviceSize.height / 22)),
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).devicePixelRatio * 6.5,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  void _handleTextChange(String newText) {
    if (newText.isEmpty ||
        newText ==
            _searchController.text
                .substring(0, _searchController.text.length - 1)) {
      setState(() {
        _searchController.text = newText;
      });
    } else {
      _searchController.text = newText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenSize.width * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.6),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: _handleTextChange,
                              decoration: InputDecoration(
                                hintText: "Enter Your City",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: _clearSearch,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  height: screenSize.width * 0.13,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: AppColors.white),
                    onPressed: () {
                      // Handle search button click
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height / 25),
            PostCard(
              avatarImageUrl: 'URL_TO_AVATAR_IMAGE',
              name: 'Sushant Dhiman',
              date: '21 August 9:38 A.M',
              imageUrl:
                  'https://images.indianexpress.com/2022/08/waterlogging-gurgaon.jpg',
              caption: 'Water logging near Salar ganj Panipat (132101)',
              likeCount: 42,
              damageCount: 303,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUploadModal(context);
        },
        backgroundColor: AppColors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
