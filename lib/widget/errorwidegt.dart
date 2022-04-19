import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/welcomescreen.dart';

class ErrorWidgets extends StatefulWidget {
  const ErrorWidgets({Key? key}) : super(key: key);

  @override
  State<ErrorWidgets> createState() => _ErrorWidgetsState();
}

class _ErrorWidgetsState extends State<ErrorWidgets> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
            child: const Text("Try Again"),
          )
        ],
        contentTextStyle: const TextStyle(
          fontSize: 14,
        ),
        content: const Text(
          "Requested data couldn't be loaded",
        ),
        title: const Text("something went wrong"),
        titleTextStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
