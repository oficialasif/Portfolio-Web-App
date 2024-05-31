import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0, // Remove elevation from the app bar
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16.0), // Set a default text size
        ),
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      endDrawer: Drawer(
        // Right-side drawer
        child: DrawerContents(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, I\'m Your Name',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A passionate Flutter developer',
              style: TextStyle(fontSize: 18.0),
            ),
            Divider(height: 30.0, thickness: 2.0),
          ],
        ),
      ),
    );
  }
}

class DrawerContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Your Name'),
          accountEmail: Text('your.email@example.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/20211021_1431162.jpg'), // Replace with the actual path
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/20211021_1431162.jpg'), // Replace with your background photo
            ),
          ),
        ),
        ListTile(
          title: Text('Skills'),
          onTap: () {
            // Navigate to the Skills section or handle as needed
          },
        ),
        ListTile(
          title: Text('Projects'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            _showProjectsDialog(context); // Show the projects dialog
          },
        ),
        ListTile(
          title: Text('Experience'),
          onTap: () {
            // Navigate to the Experience section or handle as needed
          },
        ),
        ListTile(
          title: Text('Education'),
          onTap: () {
            // Navigate to the Education section or handle as needed
          },
        ),
        ListTile(
          title: Text('Contact'),
          onTap: () {
            // Navigate to the Contact section or handle as needed
          },
        ),
      ],
    );
  }

  void _showProjectsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Projects'),
          content: Column(
            children: [
              ListTile(
                title: Text('Scientific Calculator'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigate to the Scientific Calculator project or handle as needed
                },
              ),
              ListTile(
                title: Text('Quiz App'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigate to the Quiz App project or handle as needed
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
