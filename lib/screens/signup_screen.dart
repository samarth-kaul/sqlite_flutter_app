import 'package:flutter/material.dart';
import 'package:sqlite_employee_app/screens/home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  // Colors.orange.shade700,
                  Colors.orange,
                  Colors.redAccent
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 240,
                  child: Padding(
                    padding: EdgeInsets.only(top: 120, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("SIGN UP",
                            style: TextStyle(
                                color: Color(0xffFBF9F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 47)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFBF9F1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey.shade200,
                                    offset: const Offset(0, 8),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Email or Phone Number",
                                        border: InputBorder.none,
                                        icon: Icon(
                                          Icons.email_rounded,
                                          color: Colors.black54,
                                        )),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Create Password",
                                      icon: Icon(
                                        Icons.password_rounded,
                                        color: Colors.black54,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Re-enter Password",
                                      icon: Icon(
                                        Icons.password_rounded,
                                        color: Colors.black54,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              child: Column(
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: const Text(
                                  //     "Forgot Password?",
                                  //     style: TextStyle(
                                  //         color: Colors.black54,
                                  //         fontWeight: FontWeight.bold),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 35),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70, vertical: 16),
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const Divider(
                                    indent: 30,
                                    endIndent: 30,
                                    thickness: 2,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      "Login Via..",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            // padding: const EdgeInsets.symmetric(
                                            //     horizontal: 50, vertical: 16),
                                            width: 140,
                                            height: 50,
                                            child: Center(
                                                child: const Text(
                                              "Gmail",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 140,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              color: Color(0xff316FF6),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            // padding: const EdgeInsets.symmetric(
                                            //     horizontal: 50, vertical: 16),
                                            child: const Center(
                                              child: Text(
                                                "Facebook",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already have an account?  ",
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // print("login up pressed");
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
