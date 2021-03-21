import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'finish_controller.g.dart';

@Injectable()
class FinishController = _FinishControllerBase with _$FinishController;

abstract class _FinishControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
