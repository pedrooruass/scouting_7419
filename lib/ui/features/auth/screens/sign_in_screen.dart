import 'package:flutter/material.dart';
import 'package:scoring_7419/application/repositories/auth_repository.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/images/7419_logo.png',
                width: 300, // maybe take it off
                fit: BoxFit.fitWidth, // maybe take it off
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 16),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: titleFont,
                              color: black)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44),
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              TextField(
                                controller: emailController,
                                cursorColor: darkGrey,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon:
                                      Icon(Icons.email, color: darkGrey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: darkGrey)),
                                  fillColor: grey,
                                  filled: true,
                                  focusColor: darkGrey,
                                  iconColor: darkGrey,
                                  hoverColor: darkGrey,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TextField(
                                controller: passwordController,
                                cursorColor: darkGrey,
                                obscureText: isVisible ? false : true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon:
                                      const Icon(Icons.lock, color: darkGrey),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(
                                      isVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: darkGrey,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: darkGrey,
                                    ),
                                  ),
                                  fillColor: grey,
                                  filled: true,
                                  focusColor: darkGrey,
                                  iconColor: darkGrey,
                                  hoverColor: darkGrey,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  AuthRepository.signInWithEmailAndPassword(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: darkGrey,
                                  foregroundColor: white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Expanded(
      //         child: SizedBox(
      //           height: 50,
      //           child: TextFormField(
      //             controller: emailController,
      //             decoration: const InputDecoration(labelText: 'email'),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: SizedBox(
      //           height: 50,
      //           child: TextFormField(
      //             controller: emailController,
      //             decoration: const InputDecoration(labelText: 'email'),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 24),
      //       ElevatedButton(
      //         onPressed: () {
      //           AuthRepository.signInWithEmailAndPassword(
      //             context: context,
      //             email: emailController.text,
      //             password: passwordController.text,
      //           );
      //         },
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: red,
      //         ),
      //         child: const Text('Sign In'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

// Future signIn() async {
//   await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailController.text.trim(),
//     password: passwordController.text.trim(),
//   );
// }
}
