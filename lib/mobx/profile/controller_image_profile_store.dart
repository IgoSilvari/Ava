import 'package:mobx/mobx.dart';
part 'controller_image_profile_store.g.dart';

class ControllerImageProfileStore = ControllerImageProfileStoreBase with _$ControllerImageProfileStore;

abstract class ControllerImageProfileStoreBase with Store {

  @observable
  String localImage = '';

  @action
  void changeLocalImage(String image) => localImage = image; 

  @observable
  bool isErroLoad = false;

  @action
  void changeErroLoad() => isErroLoad = true;

  // @observable
  // String? file;

  // @action
  // void changeMultipartFile(MultipartFile value) => file = value;
}