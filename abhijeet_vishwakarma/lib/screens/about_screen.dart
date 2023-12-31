import 'package:abhijeet_vishwakarma/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff2f3c42),
      body: Column(
        children: [
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
          // About
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 50),
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'About Me',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          // About Image and Data
        ],
      ),
    ));
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
