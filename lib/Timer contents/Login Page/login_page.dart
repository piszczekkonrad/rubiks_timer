import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/cubit/login_page_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';
import 'package:rubiks_timer/enums.dart';
import 'package:rubiks_timer/injection_container.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();
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
          child: BlocProvider<LoginPageCubit>(
            create: (context) => getIt()..start(),
            child: BlocBuilder<LoginPageCubit, LoginPageState>(
              builder: (context, state) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmailTextfield(emailController: emailController),
                      const SizedBox(height: 20),
                      PasswordTextfield(passController: passController),
                      const SizedBox(height: 20),
                      Text(state.errorMessage),
                      const SizedBox(height: 20),
                      LoginButton(
                          loginStatus: state.loginStatus,
                          emailController: emailController,
                          passController: passController),
                      const SizedBox(height: 20),
                      SwitchViewButton(loginStatus: state.loginStatus),
                    ]);
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: RootBottomNavigationBar(
          currentIndex: 2, setIndex: context.read<TimerRootCubit>().setIndex),
    );
  }
}

class SwitchViewButton extends StatelessWidget {
  const SwitchViewButton({
    Key? key,
    required this.loginStatus,
  }) : super(key: key);
  final LoginStatus loginStatus;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(240, 60),
      ),
      onPressed: () {
        switch (loginStatus) {
          case LoginStatus.login:
            context.read<LoginPageCubit>().showSignUpPage();
            break;
          case LoginStatus.signUp:
            context.read<LoginPageCubit>().showLoginPage();
        }
      },
      child: Text(
        loginStatus == LoginStatus.login
            ? 'Create Account'
            : 'Alredy signed up?',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.emailController,
    required this.passController,
    required this.loginStatus,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passController;
  final LoginStatus loginStatus;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        fixedSize: const Size(240, 60),
      ),
      onPressed: () async {
        switch (loginStatus) {
          case LoginStatus.login:
            context.read<LoginPageCubit>().login(
                  email: emailController.text,
                  password: passController.text,
                );
            break;
          case LoginStatus.signUp:
            context.read<LoginPageCubit>().signUp(
                  email: emailController.text,
                  password: passController.text,
                );
        }
      },
      child: Text(
        loginStatus == LoginStatus.login ? 'Log In' : 'Sign Up',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.emailController,
    required this.passController,
    required this.loginStatus,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passController;
  final LoginStatus loginStatus;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        fixedSize: const Size(240, 60),
      ),
      onPressed: () async {
        switch (loginStatus) {
          case LoginStatus.login:
            context.read<LoginPageCubit>().login(
                  email: emailController.text,
                  password: passController.text,
                );
            break;
          case LoginStatus.signUp:
            context.read<LoginPageCubit>().signUp(
                  email: emailController.text,
                  password: passController.text,
                );
        }
      },
      child: Text(
        loginStatus == LoginStatus.login ? 'Log In' : 'Sign Up',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    Key? key,
    required this.passController,
  }) : super(key: key);

  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      controller: passController,
      decoration: const InputDecoration(hintText: 'Password'),
      obscureText: true,
    );
  }
}

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'E-mail',
      ),
    );
  }
}
