import 'package:primeira_letra/app/modules/finish/finish_controller.dart';
import 'package:primeira_letra/app/modules/finish/finish_page.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FinishController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(
          "/home/finish/:acertos",
          child: (_, args) =>
              FinishPage(acertos: int.parse(args.params['acertos'])),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
