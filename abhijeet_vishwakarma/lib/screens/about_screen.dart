import 'package:abhijeet_vishwakarma/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Check if the screen width is less than 600 (small screen)
    bool isSmallScreen = screenWidth < 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2f3c42),
        appBar: isSmallScreen
            ? AppBar(
                title: Text('AV'),
                backgroundColor: Color(0xff2f3c42),
              )
            : null,
        drawer: isSmallScreen ? buildNavigationDrawer() : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                // Remaining content
                child: Column(
                  children: [
                    // About
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0, top: 50),
                          width: 220,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'About Me',
                              style: TextStyle(
                                color: Color(0xff2f3c42),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    isSmallScreen
                        ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 20),
                                padding: EdgeInsets.only(left: 50, right: 50),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    isSmallScreen
                                        ? 'assets/about.jpg'
                                        : 'profile.jpg',
                                    width: isSmallScreen
                                        ? screenWidth * 0.8
                                        : screenWidth * 0.5,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Hello! I'm Abhijeet Vishwakarma, an aspiring Engineer passionate about blending creativity and technology. With a background in engineering and a love for poetic expression, I bring a unique perspective to every project. My journey is marked by continuous learning and a commitment to creating products that make a meaningful difference. I thrive on challenges, always looking forward to contributing to a future where technology enhances our lives. Let's connect, collaborate, and innovate!",
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              // Display content for larger screens
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Hello! I'm Abhijeet Vishwakarma, an aspiring Engineer passionate about blending creativity and technology. With a background in engineering and a love for poetic expression, I bring a unique perspective to every project. My journey is marked by continuous learning and a commitment to creating products that make a meaningful difference. I thrive on challenges, always looking forward to contributing to a future where technology enhances our lives. Let's connect, collaborate, and innovate!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),

                              // Spacer to create space between content and image
                              SizedBox(width: 50),

                              // Display the image for larger screens
                              Container(
                                padding: EdgeInsets.only(right: 70),
                                child: CircleAvatar(
                                  radius: 150,
                                  backgroundImage: AssetImage('about.jpg'),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
              // Adjust the contact section
              Container(
                // Adjust the contact section
                padding: EdgeInsets.fromLTRB(
                    30, 20, 30, 0), // Top padding is set to 20
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildContactItem(
                      Icons.mail,
                      ' abhijeetvkarma@gmail.com',
                    ),
                    SizedBox(height: 20),
                    buildContactItem(
                      Icons.phone,
                      ' +91 9608577877',
                    ),
                    SizedBox(height: 20),
                    buildContactItem(
                      Icons.location_city,
                      '  Ranchi Jharkhand',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create contact items
  Widget buildContactItem(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
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
          color: Color(0xff2f3c42),
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
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
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
          // Add logic for 'Work'
        } else if (text == 'Activities') {
          // Add logic for 'Activities'
        }
      },
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
