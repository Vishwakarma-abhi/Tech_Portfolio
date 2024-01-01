import 'package:animated_background/animated_background.dart';
import 'package:abhijeet_vishwakarma/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typing_animation/typing_animation.dart';
import 'package:animated_background/animated_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // late AnimatedBackgroundController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimatedBackgroundController(
    //   duration: Duration(seconds: 10),
    // );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Check if the screen width is less than 600 (small screen)
    bool isSmallScreen = screenWidth < 600;

    return SafeArea(
      child: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(baseColor: Colors.white)),
        child: Scaffold(
          backgroundColor:
              Colors.transparent, // Set scaffold background to transparent
          appBar: isSmallScreen
              ? AppBar(
                  title: Text('AV'),
                  backgroundColor: Colors
                      .transparent, // Set appbar background to transparent
                )
              : null,
          drawer: isSmallScreen ? buildNavigationDrawer() : null,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Header or AppBar for larger screens
                isSmallScreen
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'AV',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 60),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildHeaderButton('Home', screenWidth),
                                buildHeaderButton('About', screenWidth),
                                buildHeaderButton('Work', screenWidth),
                                buildHeaderButton('Activities', screenWidth),
                              ],
                            ),
                          ),
                        ],
                      ),

                // Rest of your code
                Container(
                  // Remaining content
                  child: Column(
                    children: [
                      // Profile Image
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                        child: CircleAvatar(
                          radius: screenWidth < 600 ? 80 : 120,
                          backgroundImage:
                              AssetImage('assets/' + 'profile.png'),
                        ),
                      ),

                      // Name
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 5, 20, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color(0xffEEA504)),
                              child: Text(
                                'Abhijeet Vishwakarma',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth < 600 ? 25 : 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TypingAnimation(
                              text: 'Developer - Poet - Programmer',
                              textStyle: TextStyle(
                                  color: Colors.amber,
                                  fontSize: screenWidth < 600 ? 18 : 25,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),

                      // Social handles
                      Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildCircleAvatar('linkedin.png', 30, 'linkedin'),
                            SizedBox(
                              width: screenWidth < 600 ? 15 : 15,
                            ),
                            buildCircleAvatar('github.png', 30, 'github'),
                            SizedBox(
                              width: screenWidth < 600 ? 15 : 15,
                            ),
                            buildCircleAvatar('mail.png', 30, 'mail'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create header buttons
  Widget buildHeaderButton(String text, double screenWidth) {
    return GestureDetector(
      onTap: () {
        // Add onTap logic
        if (text == 'Home') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (text == 'About') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutScreen()),
          );
        } else if (text == 'Work') {
          // Add logic for 'Work'
        } else if (text == 'Activities') {
          // Add logic for 'Activities'
        }
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 10 : 20,
          vertical: 0.5,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 19, color: Colors.white),
        ),
      ),
    );
  }

  // Helper method to create navigation drawer for small screens
  Widget buildNavigationDrawer() {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          buildDrawerItem('Home'),
          buildDrawerItem('About'),
          buildDrawerItem('Work'),
          buildDrawerItem('Activities'),
        ],
      ),
    );
  }

  // Helper method to create drawer items
  Widget buildDrawerItem(String text) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        // Add onTap logic for drawer items
        if (text == 'Home') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (text == 'About') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutScreen()));
        } else if (text == 'Work') {
        } else if (text == 'Activities') {}
      },
    );
  }

  // Helper method to create CircleAvatar with onTap
  // Helper method to create CircleAvatar with onTap
  Widget buildCircleAvatar(String image, double radius, String link) {
    return GestureDetector(
      onTap: () {
        // Add onTap logic
        if (link == 'linkedin') {
          _launchURL('https://www.linkedin.com/in/abhijeet-vishwakarma/');
        } else if (link == 'github') {
          _launchURL('https://github.com/Vishwakarma-abhi');
        } else if (link == 'mail') {
          _launchURL(
              'mailto:abhijeetvkarma@gmail.com?subject=Subject&body=Body');
        }
      },
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage('assets/' + image),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
