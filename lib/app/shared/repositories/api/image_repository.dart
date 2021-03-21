import 'package:primeira_letra/app/shared/models/image_model.dart';
import 'package:primeira_letra/app/shared/models/interface/model_interface.dart';
import 'package:primeira_letra/app/shared/repositories/interface/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/utils/constants.dart';
import 'package:primeira_letra/app/shared/utils/helper.dart';

part 'image_repository.g.dart';

@Injectable()
class ImageRepository implements IRepository {
  final Dio client;

  ImageRepository(this.client);

  @override
  void dispose() {}

  @override
  Future<List<IModel>> getAll() async {
    client.options.headers['x-rapidapi-key'] = API_KEY;
    client.options.headers['x-rapidapi-host'] = API_HOST;
    client.options.queryParameters['q'] = '';
    client.options.queryParameters['count'] = '1';
    final response = await client.get('');

    List<ImageModel> lista = [];
    for (var json in response.data) {
      lista.add(ImageModel.fromJson(json['value']));
    }
    return lista;
  }

  @override
  Future<List<IModel>> getByWord(String word) async {
    client.options.headers['x-rapidapi-key'] = API_KEY;
    client.options.headers['x-rapidapi-host'] = API_HOST;

    var queryParameters = {
      'q': word,
      'count': '1',
    };

    final response = await client.get('', queryParameters: queryParameters);

    List<ImageModel> lista = [];
    for (var json in response.data['value']) {
      lista.add(ImageModel.fromJson(json));
      lista[0].imageName = word;
    }

    return lista;
  }

  Future<ImageModel> getImageByWord(String word) async {
    var queryParameters = {
      'key': API_KEY,
      'q': word,
    };

    try {
      final response = await client.get('', queryParameters: queryParameters);

      List<ImageModel> lista = [];
      for (var json in response.data['hits']) {
        lista.add(ImageModel.fromJson(json));
        lista[0].imageName = word;
        lista[0].options = Helper.options(word.substring(0, 1));
      }

      return lista[0];
    } catch (e) {
      getImageByWord(word);
    }
  }

  Future<List<IModel>> getListByWords(
      List<ImageModel> images, String word) async {
    ImageModel image = await getImageByWord(word);

    images.add(image);

    print('Imagem: $image');

    return images;
  }
}
