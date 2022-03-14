import 'dart:io';

import 'package:designs/pages/profile/show_photo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final stories = [
    Story(
        image:
            'https://media.istockphoto.com/photos/two-glad-positive-grinning-lady-stand-in-glasses-spectacles-street-picture-id1092715214?k=20&m=1092715214&s=612x612&w=0&h=zGqeL97C6ybvoy--1AIE3UOpc7lj-usdErvMm1JmR-E='),
    Story(
        image:
            'https://media.istockphoto.com/photos/friends-taking-selfie-during-beach-party-picture-id1035679516?k=20&m=1035679516&s=612x612&w=0&h=ORwGSTss849SvhPuNCsVNYGHFxr_LULyJQIRlrUNGvQ='),
    Story(
        image:
            'https://media.istockphoto.com/photos/multiethnic-friends-taking-selfies-at-the-beach-on-summer-holidays-picture-id867345208?k=20&m=867345208&s=612x612&w=0&h=zD5uW_5ZJ135EOc-TlyQI6g86Dib-sGJR-v09-a0P5w='),
    Story(
        image:
            'https://media.istockphoto.com/photos/friends-making-a-selfie-together-at-party-picture-id903724814?k=20&m=903724814&s=612x612&w=0&h=OS5zhRTSSaMFr_zNHTJq0_mtdMHWGyaC7pCI_LR5Ees='),
    Story(
        image:
            'https://media.istockphoto.com/photos/cheerful-university-student-taking-selfie-with-friends-sitting-on-picture-id1226665494?k=20&m=1226665494&s=612x612&w=0&h=P8fKSHMMRyvj3ka3DiXxLP0-jNasPTFBneNrQzhJd38='),
    Story(
        image:
            'https://media.istockphoto.com/photos/friends-take-selfie-in-chinatown-downtown-los-angeles-at-night-picture-id1136610455?k=20&m=1136610455&s=612x612&w=0&h=RNPFu8tcSJinnqLYgPVrEebqdCnQS7v538FnVCSyvMg='),
    Story(
        image:
            'https://media.istockphoto.com/photos/cute-girls-taking-selfies-on-paris-trip-picture-id1069192558?k=20&m=1069192558&s=612x612&w=0&h=TE6aMxdkdJPfTEhFkqgFuiuccAahN1dwj2BV9FN5FEM='),
    Story(
        image:
            'https://media.istockphoto.com/photos/close-up-photo-beautiful-amazing-she-her-lady-make-take-selfies-show-picture-id1146488158?k=20&m=1146488158&s=612x612&w=0&h=e_8z38LZTN0nLItWgVEALHyuwy-_hxe2HfJBl7rUoUA='),
    Story(
        image:
            'https://media.istockphoto.com/photos/close-up-photo-of-cheerful-fellows-in-formal-wear-sit-around-table-picture-id1173816588?k=20&m=1173816588&s=612x612&w=0&h=p5FEPqsCKgRp8wv9yvuyhjpbNQmTtE6Tm2L0N3NrJsY='),
    Story(
        image:
            'https://media.istockphoto.com/photos/hipster-teen-friends-taking-a-selfie-outdoors-at-the-beach-picture-id514388630?k=20&m=514388630&s=612x612&w=0&h=285BiNxh0ujnn2q_HtvKe47sBWxmi2rO0X7DG2d53YI='),
    Story(
        image:
            'https://media.istockphoto.com/photos/close-up-full-length-body-size-photo-of-jump-high-in-star-shape-picture-id1092629852?k=20&m=1092629852&s=612x612&w=0&h=aoix_jlpjdGjSBoMcCiY4m4GB5YlUUG45EXkf1xE-SY='),
  ];

  final _profilePhoto = Story(
    image:
        'https://media.istockphoto.com/photos/woman-making-photo-on-her-smartphone-on-blue-background-picture-id973877822?k=20&m=973877822&s=612x612&w=0&h=0FwSIhTnlanEVRO1WWgUcVIkyEnJx9UjTX9gmEI4Aaw=',
  );

  final ScrollController _scrollController = ScrollController();
  var _colorAppBar = Colors.transparent;

  @override
  void initState() {
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    if (_scrollController.position.pixels >=
        MediaQuery.of(context).size.width * 0.5) {
      if (_colorAppBar != Theme.of(context).primaryColor) {
        setState(() {
          _colorAppBar = Theme.of(context).primaryColor;
        });
      }
    } else {
      if (_colorAppBar != Colors.transparent) {
        setState(() {
          _colorAppBar = Colors.transparent;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heiApp = AppBar().preferredSize.height;
    print(heiApp);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size.width,
                  child: Stack(
                    children: [
                      FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: const NetworkImage(
                          'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
                        ),
                        height: size.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Transform.translate(
                          offset: const Offset(0, 1),
                          child: Container(
                            width: size.width,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) =>
                                  ShowPhotoPage(photo: _profilePhoto),
                            ),
                          );
                        },
                        child: Hero(
                          tag: _profilePhoto.image.toString(),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              _profilePhoto.image,
                            ),
                            radius: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Lupita Melchor',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              'Developer',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          child: const Text('follow'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.red,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _stadsProfile('Friends', '1505'),
                      _stadsProfile('Followers', '1505'),
                      _stadsProfile('Following', '1505'),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: const Text(
                    'Stories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: stories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: ((context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ShowPhotoPage(photo: stories[index]),
                                );
                              }),
                            ),
                          );
                          /* Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  ShowPhotoPage(photo: stories[index]),
                            ),
                          ); */
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 130,
                              height: 180,
                              child: Hero(
                                tag: stories[index].image.toString(),
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder:
                                      const AssetImage('assets/loading.gif'),
                                  image: NetworkImage(stories[index].image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: _colorAppBar,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _stadsProfile(String title, String quantity) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          quantity,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 5,
          width: 50,
          color: Colors.black,
        )
      ],
    );
  }
}

class Story {
  final String image;

  Story({required this.image});
}
