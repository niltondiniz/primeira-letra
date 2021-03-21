import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:primeira_letra/app/shared/models/image_model.dart';
import 'package:primeira_letra/app/shared/repositories/api/image_repository.dart';
import 'package:primeira_letra/app/shared/utils/constants.dart';

void main() {
  ImageRepository repository;
  Dio client;

  setUp(() {
    client = Dio(BaseOptions(baseUrl: URL_BASE));
    repository = ImageRepository(client);
  });

  group('ImageRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<ImageRepository>());
    });

    test('Lista os 9 repositorios de nilton diniz', () async {
      var data = await repository.getByWord('cachorro');
      expect(data.length, 1);
    });

    test('Lista os 9 repositorios de nilton diniz', () async {
      List<ImageModel> images = [];
      var data = await repository.getListByWords(images, 'porco');
      data = await repository.getListByWords(images, 'cavalo');
      expect(data.length, 2);
    });
  });
}
