import 'package:flutter/material.dart';
import 'package:sua_notify/screens/teacher/authentication/register.dart';
import 'package:sua_notify/screens/teacher/button_nav/button_nav.dart';


class LectureLoginScreen extends StatefulWidget {
  const LectureLoginScreen({super.key});

  @override
  State<LectureLoginScreen> createState() => _LectureLoginScreenState();
}

class _LectureLoginScreenState extends State<LectureLoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration:  BoxDecoration(
                  // color: const Color.fromARGB(255, 41, 97, 18),
                  image: const DecorationImage(
                    image: AssetImage("assets/icons/green.png"),
                    fit: BoxFit
                        .contain, // Adjust the image size while keeping its aspect ratio
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Welcome, Lecturer!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Streamline your communication with students through smart timetable updates.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon:
                            Icon(Icons.email, color: const Color.fromARGB(255, 41, 97, 18),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon:
                            Icon(Icons.lock, color: const Color.fromARGB(255, 41, 97, 18),),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 41, 97, 18),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // Make buttons full-width
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
                            builder: (context) =>
                                const LectureButtomBar(), // Replace with actual screen
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15), // Adjust padding for height
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       "Don't have an account?  ",
              //     ),
              //     GestureDetector(
              //       child: const Text(
              //         "Register", style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const LectureRegisterScreen()),
              //         );
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
