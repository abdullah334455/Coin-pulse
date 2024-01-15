import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This line hides the debug banner
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 34, 34), // Dark background color
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Logo and Welcome Text
                Column(
                  children:[
                    Image.asset(
  'assets/logo/bitcoin_logo.png', // Make sure this path matches the file location in your assets folder
  height: 100.0,
),
                    SizedBox(height: 24.0),
                    Text(
                      'Coin Pulse',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Welcome to Coin Pulse\nDive into the future of crypto trading with Coin Pulse, your go-to app for precise coin predictions.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        height: 1.5, // Line spacing
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.0),
                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    // Handle Log In
                  },
                  child: Text('Log in'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Button color
                    onPrimary: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Sign Up Button
                OutlinedButton(
                  onPressed: () {
                    // Handle Sign Up
                  },
                  child: Text('Sign up'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.orange, // Text color
                    side: BorderSide(color: Colors.orange), // Border color
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}