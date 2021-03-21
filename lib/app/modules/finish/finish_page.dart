import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/utils/helper.dart';
import 'package:primeira_letra/app/shared/widgets/high_widget.dart';
import 'package:primeira_letra/app/shared/widgets/low_widget.dart';
import 'package:primeira_letra/app/shared/widgets/medium_widget.dart';
import 'finish_controller.dart';

class FinishPage extends StatefulWidget {
  final String title;
  final int acertos;
  const FinishPage({Key key, this.title = "Finish", this.acertos})
      : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends ModularState<FinishPage, FinishController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    Helper.playFinishSound(widget.acertos);
  }

  Widget getFinishResult(int acertos) {
    if (acertos < 4) {
      return LowWidget(acertos: acertos);
    } else if (acertos < 7) {
      return MediumWidget(acertos: acertos);
    } else {
      return HighWidget(acertos: acertos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: getFinishResult(widget.acertos),
      ),
    );
  }
}
