import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/models/interface/model_interface.dart';

abstract class IRepository extends Disposable {
  Future<List<IModel>> getAll();

  Future<List<IModel>> getByWord(String word);
}
