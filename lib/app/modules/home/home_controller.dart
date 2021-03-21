import 'dart:io';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/models/image_model.dart';
import 'package:primeira_letra/app/shared/repositories/api/image_repository.dart';
import 'package:primeira_letra/app/shared/utils/words.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ImageRepository imageRepository;

  @observable
  var listImage = ObservableList<ImageModel>();

  @observable
  ImageModel actualImage;

  @observable
  int value = 0;

  @observable
  int acertos = 0;

  @observable
  int erros = 0;

  _HomeControllerBase(this.imageRepository) {}

  Future<void> initList() async {
    actualImage = null;
    listImage = ObservableList<ImageModel>();
    acertos = 0;
    erros = 0;

    var rng = new Random();

    for (var i = 0; i < 10; i++) {
      await imageRepository.getListByWords(listImage, words[rng.nextInt(20)]);
      sleep(Duration(milliseconds: 500));
    }

    setActualImage(listImage[0]);
    print(listImage.length);
  }

  @action
  void addImage(ImageModel image) => listImage.add(image);

  @action
  void setActualImage(ImageModel image) => actualImage = image;

  @action
  void incrementAcertos() {
    acertos++;
  }

  @action
  void incrementErros() {
    erros++;
  }
}
