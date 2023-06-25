import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  _LoginPageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                controller: widget.emailController,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                controller: widget.passController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: const Size(240, 60),
                ),
                onPressed: () async {
                  if (isCreatingAccount == false) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                child: Text(
                  isCreatingAccount == false ? 'Log In' : 'Sign Up',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(240, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
              if (isCreatingAccount) ...[
                TextButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(240, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: Text(
                    'Alredy signed up?',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
      bottomNavigationBar: RootBottomNavigationBar(
          currentIndex: 2, setIndex: context.read<TimerRootCubit>().setIndex),
    );
  }
}
