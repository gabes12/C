import 'package:aptiv/frota_screen.dart';
import 'package:aptiv/icon.dart';
import 'package:aptiv/menu_screen.dart';
import 'package:aptiv/restaurante_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConvenioScreen extends StatelessWidget {
  const ConvenioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 12),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Convênio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        IconWidget(icon: Icons.handshake_outlined)
                      ],
                    ),
                    const SizedBox(height: 128),
                    SizedBox(
                        child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: [
                        MenuButton(
                            buttonText: 'Restaurante',
                            icon: const Icon(Icons.restaurant,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const RestauranteScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Frota',
                            icon: const FaIcon(FontAwesomeIcons.bus,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FrotaScreen()));
                            }),
                      ],
                    )),
                    const SizedBox(height: 256),
                    OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Colors.orange, width: 4))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MenuScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: IntrinsicWidth(
                                child: Row(
                              children: [
                                Text(
                                  'Voltar',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade400),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.orange.shade400,
                                  size: 32,
                                )
                              ],
                            ))))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
