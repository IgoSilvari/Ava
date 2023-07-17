import 'package:flutter/material.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/model/address_model.dart';

class DescriptionAddress extends StatelessWidget {
  const DescriptionAddress({required this.address,super.key});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: AvaColor.appPrimarySwatch,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            address.logradouro ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: RichText(
              text: TextSpan(
                text: address.bairro ?? '',
                children: [
                  TextSpan(text: ' / ${address.cidade} / '),
                  TextSpan(text: address.uf),
                ],
              ),
            ),
          ),
          Text(
            'Cep: ${address.cep ?? ''}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
