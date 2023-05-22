import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lest/product/theme/custom_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String _farmerImage =
      'https://npr.brightspotcdn.com/dims4/default/4d0d244/2147483647/strip/true/crop/878x593+0+0/resize/880x594!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F31%2Fdb%2F7e1d395a445fba229e9696a3a7e4%2Ffarmer-lee-jones.jpg';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5,
                                100,
                              ),
                              bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5,
                                100,
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5,
                                100,
                              ),
                              bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5,
                                100,
                              ),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: _farmerImage,
                                  fit: BoxFit.cover,
                                ),
                                BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: CustomColors.primaryColor.withOpacity(.6),
                            ),
                            child: const Text(
                              'Cora Richardson',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffD8D8D8),
                              child: Icon(
                                Icons.chat,
                                size: 30,
                                color: Color(0xff6E6E6E),
                              ),
                            ),
                            CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  CachedNetworkImageProvider(_farmerImage),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffD8D8D8),
                              child: Icon(
                                Icons.call,
                                size: 30,
                                color: Color(0xff6E6E6E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    '''Meet John, a dedicated and passionate farmer with years of experience in cultivating the land. With a deep love for nature and a strong commitment to sustainable farming practices, John takes pride in growing high-quality crops that nourish both the body and the soul.''',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Strawberry',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Banana',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Grappe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tomato',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: const Color(0xffF8F8F8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text('Products'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      const Column(
                        children: [
                          Text('Followers'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      const Column(
                        children: [
                          Text('Following'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      );
}
