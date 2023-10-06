import 'package:aptiv/menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Banner(),
                const SizedBox(height: 256),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Column(
                    children: [
                      Input(
                          icon: Icons.person,
                          text: 'REGISTRO',
                          isPassword: false),
                      SizedBox(height: 8),
                      Input(
                          icon: Icons.lock_outline,
                          text: 'SENHA',
                          isPassword: true)
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black, width: 6))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MenuScreen()));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        child: const IntrinsicWidth(
                            child: Row(
                          children: [
                            Text(
                              'ENTRAR',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.black,
                              size: 48,
                            )
                          ],
                        ))))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.orange[400],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: Colors.deepOrange[300], radius: 4),
          const SizedBox(width: 8),
          const Text(
            'A P T I V',
            style: TextStyle(
                color: Colors.black, fontSize: 48, fontWeight: FontWeight.w900),
          ),
          const SizedBox(width: 8),
          CircleAvatar(backgroundColor: Colors.deepOrange[300], radius: 4),
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isPassword;

  const Input(
      {super.key,
      required this.icon,
      required this.text,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          TextField(
            obscureText: isPassword ? true : false,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 6)),
              suffixIcon: Icon(icon, color: Colors.black, size: 40),
            ),
          )
        ],
      ),
    );
  }
}
