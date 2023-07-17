import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
  int? id;
  int? userId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  @JsonKey(name: 'localidade')
  String? cidade;
  String? uf;

  AddressModel({
    this.id,
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.cidade,
    this.uf,
    this.userId,
  });


  
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
