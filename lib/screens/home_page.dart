import 'dart:io';

import 'package:aqua_watch_app/controllers/posts/api.dart';
import 'package:aqua_watch_app/controllers/posts/new_post.dart';
import 'package:aqua_watch_app/model/post/post.dart';
import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCard extends StatefulWidget {
  final String avatarImageUrl;
  final String name;
  final String date;
  final String imageUrl;
  final String caption;
  final int likeCount;
  final String time;
  final List<double> coordinates;

  const PostCard({
    required this.avatarImageUrl,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.caption,
    required this.likeCount,
    required this.time,
    required this.coordinates,
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
                    child: Text('Report Fake'),
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
                InkWell(
                  onTap: () {
                    /////////////////////////////////////////////////

                    // Integrate Increase Like Count API.

                    /////////////////////////////////////////////////
                  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.grey,
                    size: 20,
                  ),
                ),
                SizedBox(width: screenSize.width / 50),
                Text(
                  '${widget.likeCount}',
                  style: TextStyle(color: AppColors.grey, fontSize: 14),
                ),
                SizedBox(width: screenSize.width / 20),
                Text(
                  '${widget.date}  ${widget.time}',
                  style: TextStyle(color: AppColors.grey, fontSize: 15),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      try {
                        launchUrl(Uri.parse(
                            'http://maps.google.com/maps?q=loc:${widget.coordinates[0]},${widget.coordinates[1]}'));
                      } catch (e) {
                        // https://en.wikipedia.org/wiki/Geo_URI_scheme
                        launchUrl(Uri.parse(
                            'geo:${widget.coordinates[0]},${widget.coordinates[1]}'));
                      }
                    },
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.grey,
                    ))
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
  final TextEditingController _searchController = TextEditingController();
  final postController = Get.put(PostController());
  final newPostController = Get.put(NewPostController());
  final newPostTextController = TextEditingController();

  File? _imageFile;
  final picker = ImagePicker();
  bool _isImageSelected = false;

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
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.70,
          child: Column(
            children: [
              Container(
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
                child: InkWell(
                  onTap: () async {
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = File(pickedFile.path);
                        _isImageSelected = true;
                      });
                      print('Image Selected Successfully');
                    } else {
                      throw Exception("Cannot pick image");
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isImageSelected
                          ? Image.file(
                              _imageFile!,
                              fit: BoxFit.fill,
                              height: deviceSize.height / 4,
                            )
                          : Image.asset(
                              'assets/Upload File.png',
                              height: 50.0, // Adjust the height as needed
                            ),
                      _isImageSelected
                          ? Container()
                          : SizedBox(
                              height:
                                  16.0), // Add spacing between image and text
                      _isImageSelected
                          ? Container()
                          : Center(
                              child: Text(
                                _isImageSelected
                                    ? 'Image Selected '
                                    : 'Tap To Upload',
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
                          controller: newPostTextController,
                          decoration: InputDecoration(
                            // label: Text('Describe Issue'),
                            hintText: 'Describe Issue',
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
                            isSelected: false,
                            onTap: () {
                              newPostController.addNewPost(
                                  _imageFile, newPostTextController.text);
                            }),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Clean Water",
                            isSelected: false,
                            onTap: () {
                              newPostController.addNewPost(
                                  _imageFile, newPostTextController.text);
                            }),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Drainage",
                            isSelected: false,
                            onTap: () {
                              newPostController.addNewPost(
                                  _imageFile, newPostTextController.text);
                            })
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
                            isSelected: false,
                            onTap: () {
                              newPostController.addNewPost(
                                  _imageFile, newPostTextController.text);
                            }),
                        OutlineButtonIssueType(
                            deviceSize: deviceSize,
                            title: "Other",
                            isSelected: false,
                            onTap: () {
                              newPostController.addNewPost(
                                  _imageFile, newPostTextController.text);
                            }),
                      ],
                    ),
                  ),
                  //
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
        print(_searchController.text);
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
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
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
                      postController.performSearch(_searchController.text);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height / 25),
            Obx(
              () => FutureBuilder<List<Post>>(
                future: postController.city.value == ""
                    ? postController.fetchPosts()
                    : postController
                        .fetchPostsByCity(postController.city.value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No events available'));
                  } else {
                    return SizedBox(
                      height: Get.height / 1.47,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Post post = snapshot.data![index];
                          return PostCard(
                              avatarImageUrl: post.imageUrl,
                              name: post.user,
                              date: post.date,
                              imageUrl: post.imageUrl,
                              caption: post.description,
                              likeCount: post.damageScore,
                              time: post.time,
                              coordinates: post.coordinates);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Get.height / 30),
        child: FloatingActionButton(
          onPressed: () {
            _showUploadModal(context);
          },
          backgroundColor: AppColors.black,
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
