import 'package:aptiv/consultas_screen.dart';
import 'package:aptiv/convenio_screen.dart';
import 'package:aptiv/info_screen.dart';
import 'package:aptiv/main.dart';
import 'package:aptiv/saude_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.center,
              child: Text('Bem vindo',
                  style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: [
                        MenuButton(
                            buttonText: 'Consultas',
                            icon: const Icon(Icons.search,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConsultasScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Convênio',
                            icon: const Icon(Icons.handshake_outlined,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConvenioScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Saúde',
                            icon: const Icon(Icons.local_hospital_outlined,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HealthScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Informações',
                            icon: const Icon(Icons.info_outline,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoScreen()));
                            }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    MenuButton(
                        buttonText: 'RH Atende',
                        icon: const FaIcon(FontAwesomeIcons.whatsapp,
                            size: 42, color: Colors.white),
                        onPressed: () async {
                          var contact = "+5535999999999";
                          var iosUrl = Uri.parse(
                              "https://api.whatsapp.com/send/?phone=$contact&text&type=phone_number&app_absent=0");

                          try {
                            await launchUrl(iosUrl);
                          } catch (e) {
                            throw 'Opa';
                          }
                        }),
                    const SizedBox(height: 32),
                    OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Colors.orange, width: 4))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyApp()));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: IntrinsicWidth(
                                child: Row(
                              children: [
                                Text(
                                  'SAIR',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade400),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.logout,
                                  color: Colors.orange.shade400,
                                  size: 40,
                                )
                              ],
                            ))))
                  ],
                ))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class MenuButton extends StatelessWidget {
  final String buttonText;
  final Widget icon;
  final VoidCallback onPressed;

  const MenuButton(
      {super.key,
      required this.buttonText,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange.shade400, width: 4),
                  padding: const EdgeInsets.all(20),
                  shape: const CircleBorder()),
              onPressed: onPressed,
              child: icon,
            ),
            GestureDetector(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.orange.shade400,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.orange.shade400,
      padding: const EdgeInsets.only(top: 48, bottom: 16),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: Colors.black, radius: 4),
          Text(
            'APTIV',
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(backgroundColor: Colors.black, radius: 4),
        ],
      ),
    );
  }
}
