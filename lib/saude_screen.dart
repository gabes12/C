import 'package:aptiv/cartaofarmacia_screen.dart';
import 'package:aptiv/icon.dart';
import 'package:aptiv/menu_screen.dart';
import 'package:aptiv/planosaude_screen.dart';
import 'package:aptiv/segurodevida_screen.dart';
import 'package:aptiv/uniodonto_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

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
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Saúde',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        IconWidget(icon: Icons.local_hospital_outlined)
                      ],
                    ),
                    SizedBox(
                        child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: [
                        MenuButton(
                            buttonText: 'Plano de saúde',
                            icon: const FaIcon(FontAwesomeIcons.envelope,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PlanoSaudeScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Cartão Farmácia',
                            icon: const FaIcon(
                                FontAwesomeIcons.prescriptionBottleMedical,
                                size: 42,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const CartaoFarmaciaScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Seguro de Vida',
                            icon: const FaIcon(FontAwesomeIcons.heart,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SeguroVidaScreen()));
                            }),
                        MenuButton(
                            buttonText: 'Uniodonto',
                            icon: const FaIcon(FontAwesomeIcons.tooth,
                                size: 42, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UniodontoScreen()));
                            }),
                      ],
                    )),
                    const SizedBox(height: 128),
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
