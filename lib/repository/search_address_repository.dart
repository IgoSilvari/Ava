import 'dart:convert';
import 'package:teste_ava/model/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:teste_ava/repository/repository.dart';
import 'package:teste_ava/repository/request_response.dart';

class SearchAddressRepository{
  const SearchAddressRepository();

  Future<RequestResponse<AddressModel>?> address({required String cep}) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://viacep.com.br/ws/$cep/json/',
        ),
        headers: Repository.basicHeaders,
      );
      AddressModel? addressModel;
      final map = json.decode(response.body);
      if (map != null) {
        addressModel = AddressModel.fromJson(map);
      }
      return RequestResponse(response, addressModel);
    } catch (erro) {
      return null;
    }
  }


}