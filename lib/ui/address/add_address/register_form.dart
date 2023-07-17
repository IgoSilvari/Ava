import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/mobx/address/request_data_address_store.dart';
import 'package:teste_ava/ui/widget/widget_form_field_defaut.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.controllerCep,
    required this.controllerstreet,
    required this.controllerComplement,
    required this.controllerNeighborhood,
    required this.controllerCity,
    required this.controllerState,
    super.key,
  });

  final TextEditingController controllerCep;
  final TextEditingController controllerstreet;
  final TextEditingController controllerComplement;
  final TextEditingController controllerNeighborhood;
  final TextEditingController controllerCity;
  final TextEditingController controllerState;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetFormFieldDefaut(
          title: 'CEP',
          hintText: '00.000-000',
          controller: widget.controllerCep,
          textInputAction: TextInputAction.search,
          textInputType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          onChanged: (value) {
            if (value.length == 10) {
              loadDataAddress(value);
            }
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'É obrigatorio informar o Cep';
            }
            if (value?.length != 10) {
              return 'Cep inválido';
            }
            return null;
          },
        ),
        WidgetFormFieldDefaut(
          title: 'Endereço',
          hintText: 'Ex: Rua João Damasceno',
          controller: widget.controllerstreet,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'É obrigatorio informar o endereço';
            } else if (value!.length < 2) {
              return 'Endereço inválido';
            }
            return null;
          },
        ),
        WidgetFormFieldDefaut(
          title: 'Complemento',
          hintText: '',
          controller: widget.controllerComplement,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          validator: (value) => null,
        ),
        WidgetFormFieldDefaut(
          title: 'Bairro',
          hintText: 'Ex: Rio Novo',
          controller: widget.controllerNeighborhood,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'É obrigatório informar o bairro';
            }
            return null;
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: WidgetFormFieldDefaut(
                title: 'Cidade',
                hintText: 'Ex: Cascavel',
                controller: widget.controllerCity,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'É obrigatório informar a cidade';
                  }
                  return null;
                },
              ),
            ),
            const Divider(
              color: Colors.transparent,
              indent: 5,
            ),
            Expanded(
              child: WidgetFormFieldDefaut(
                title: 'Estado',
                hintText: 'Ex: CE',
                controller: widget.controllerState,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [LengthLimitingTextInputFormatter(2)],
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'É Obrigatorio a informação';
                  }if (value?.length != 2) {
                    return 'Ex: CE';
                  }
                  return null;
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Future<void> loadDataAddress(String cep) async {
    final result = Provider.of<RequestDataAddressStore>(context, listen: false);
    FocusManager.instance.primaryFocus?.unfocus();
    result.searchAddress(cep: cep).then((value) {
      widget.controllerstreet.text = value?.logradouro ?? '';
      widget.controllerComplement.text = value?.complemento ?? '';
      widget.controllerNeighborhood.text = value?.bairro ?? '';
      widget.controllerCity.text = value?.cidade ?? '';
      widget.controllerState.text = value?.uf ?? '';
    });
  }
}
