import 'package:flutter/material.dart';
import 'package:sua_notify/screens/cr/authentication/login.dart';
import 'package:sua_notify/screens/teacher/authentication/login.dart';

class LectureRegisterScreen extends StatefulWidget {
  const LectureRegisterScreen({super.key});

  @override
  State<LectureRegisterScreen> createState() => _LectureRegisterScreenState();
}

class _LectureRegisterScreenState extends State<LectureRegisterScreen> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/icons/green.png"),
                    fit:
                        BoxFit
                            .contain, // Adjust the image size while keeping its aspect ratio
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Register as Class Rep",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Help your classmates stay updated. Share and manage timetable changes with ease.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 41, 97, 18),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        prefixIcon: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 41, 97, 18),
                        ),
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
                        prefixIcon: Icon(
                          Icons.lock,
                          color: const Color.fromARGB(255, 41, 97, 18),
                        ),
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
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: const Color.fromARGB(255, 41, 97, 18),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 41, 97, 18),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
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
                            builder:
                                (context) =>
                                    const LectureRegisterScreen(), // Replace with actual screen
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ), // Adjust padding for height
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?  "),
                  GestureDetector(
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LectureLoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
