import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: Lottie.asset('assets/animation/list_empty.json'),
        ),
        const Text('Não há endereços cadastrados')
      ],
    );
  }
}
