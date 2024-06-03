import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_login/pages/register_page.dart';
import 'package:glassmorphism_login/pages/rtb_page.dart';

bool isRotated = false;

class GlassmorphismLogin extends StatefulWidget {
  const GlassmorphismLogin({super.key});

  @override
  State<GlassmorphismLogin> createState() => _GlassmorphismLoginState();
}

TextEditingController passwordTC = TextEditingController();
TextEditingController emailTC = TextEditingController();

bool isnima = false;

bool errorEmailAddress = true;

class _GlassmorphismLoginState extends State<GlassmorphismLogin> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    isRotated =
        MediaQuery.of(context).size.height < MediaQuery.of(context).size.width;
    return isRotated
        ? Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "assets/images/img.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                const Align(
                  alignment: Alignment(-0.9, -0.2),
                  child: Text(
                    "Whatever happens\nhere, stays here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(-0.9, 0.1),
                  child: Text(
                    "Please fill the form on the below.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.6, 0.1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 650 / 850,
                        width: MediaQuery.of(context).size.width * 460 / 1336,
                        color: Colors.white10,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: globalKey, // Form ga globalKey biriktirish
                            child: Column(
                              children: [
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      "Your Email",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: emailTC,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    counterStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    prefixIcon: Icon(Icons.person),
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Colors
                                          .white, // Set the error text color to white
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != null &&
                                        value.contains("@gmail.com")) {
                                      return null;
                                    } else {
                                      return 'Please enter your email address\nExample => (example@gmail.com)';
                                    }
                                  },
                                  onChanged: (value) {
                                    if (globalKey.currentState != null) {
                                      globalKey.currentState!.validate();
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: passwordTC,
                                  obscureText: isnima,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    counterStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isnima = !isnima;
                                        });
                                      },
                                      icon: isnima
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    ),
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Colors
                                          .white, // Set the error text color to white
                                    ),
                                  ),
                                  validator: (value) {
                                    RegExp regex = RegExp(
                                        r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                                    if (value != null &&
                                        regex.hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Must be 8 or more characters and contain at least 1\nnumber or special character';
                                    }
                                  },
                                  onChanged: (value) {
                                    if (globalKey.currentState != null) {
                                      globalKey.currentState!.validate();
                                    }
                                  },
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        backgroundColor:
                                            const Color(0xffDC3845),
                                      ),
                                      onPressed: () {
                                        var natija =
                                            globalKey.currentState!.validate();
                                        if (natija) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const RTPage(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Ma`lumotlarni To`ldiring'),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 145, vertical: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Lets Go",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.arrow_forward_outlined,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Do you have account?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Sign up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "assets/images/img_2.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                const Align(
                  alignment: Alignment(0, -0.7),
                  child: Text(
                    "Whatever happens\n  here, stays here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0, -0.5),
                  child: Text(
                    "Please fill the form on the below.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        height: 550,
                        width: 330,
                        color: Colors.white10,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: globalKey, // Form ga globalKey biriktirish
                            child: Column(
                              children: [
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      "Your Name",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    counterStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    hintText: "Darsh Bhavsar",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Please enter your name';
                                    }
                                  },
                                  onChanged: (value) {
                                    if (globalKey.currentState != null) {
                                      globalKey.currentState!.validate();
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    counterStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Please enter your password';
                                    }
                                  },
                                  onChanged: (value) {
                                    if (globalKey.currentState != null) {
                                      globalKey.currentState!.validate();
                                    }
                                  },
                                ),
                                const SizedBox(height: 30),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Forgot Password!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        backgroundColor:
                                            const Color(0xffDC3845),
                                      ),
                                      onPressed: () {
                                        var natija =
                                            globalKey.currentState!.validate();
                                        if (natija) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterPage(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Please fill out the information'),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 70, vertical: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Lets Go",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.arrow_forward_outlined,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Do you have account?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
