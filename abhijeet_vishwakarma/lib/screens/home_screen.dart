import 'package:abhijeet_vishwakarma/screens/about_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2f3c42),
        body: Column(
          children: <Widget>[
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'AV',
                    style: TextStyle(color: Colors.white, fontSize: 60),
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
              child: Column(
                children: [
                  // Profile Image
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: CircleAvatar(
                      radius: screenWidth < 600 ? 80 : 120,
                      backgroundImage: AssetImage('profile.png'),
                    ),
                  ),

                  // Name
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
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
                        Text(
                          'Developer - Poet - Programmer',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth < 600 ? 16 : 20,
                              fontWeight: FontWeight.bold),
                        ),
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
                          width: screenWidth < 600 ? 10 : 15,
                        ),
                        buildCircleAvatar('github.png', 30, 'github'),
                        SizedBox(
                          width: screenWidth < 600 ? 10 : 15,
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
    );
  }

  // Helper method to create header buttons
  Widget buildHeaderButton(String text, double screenWidth) {
    return GestureDetector(
      onTap: () {
        // Add onTap logic
        if (text == 'Home') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (text == 'About') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutScreen()));
        } else if (text == 'Work') {
        } else if (text == 'Activities') {}
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 10 : 20,
          vertical: 0.5,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 214, 229),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ),
    );
  }

  // Helper method to create CircleAvatar with onTap
  Widget buildCircleAvatar(String image, double radius, String link) {
    return GestureDetector(
      onTap: () {
        // Add onTap logic
        if (link == 'linkedin') {
          // go to linkedin profile
        } else if (link == 'github') {
          // go to github profile
        } else if (link == 'mail') {
          // go to email
        }
      },
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
