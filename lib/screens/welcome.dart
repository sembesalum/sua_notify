import 'package:flutter/material.dart';
import 'package:sua_notify/screens/cr/authentication/login.dart';
import 'package:sua_notify/screens/teacher/authentication/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 41, 97, 18),
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/hero.png"),
                        fit:
                            BoxFit
                                .contain, // Adjust the image size while keeping its aspect ratio
                      ),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const Spacer(), // Pushes the buttons to the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                    color: const Color.fromARGB(255, 41, 97, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  
                                  const CrLoginScreen() // Replace with actual screen
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Login As Class Rep!",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    color: const Color.fromARGB(255, 41, 97, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LectureLoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Login As Lecture",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Optional space below buttons
          ],
        ),
      ),
    );
  }
}
