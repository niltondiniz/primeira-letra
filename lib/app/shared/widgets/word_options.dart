import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/utils/helper.dart';
import '../../modules/home/home_controller.dart';

class WordOptions extends StatefulWidget {
  const WordOptions(
      {Key key, @required this.controller, @required List<String> this.options})
      : super(key: key);

  final HomeController controller;
  final List<String> options;

  @override
  WordOptionsState createState() => WordOptionsState();
}

class WordOptionsState extends State<WordOptions> {
  int index = 0;
  List<Color> cores = [Colors.black, Colors.black, Colors.black, Colors.black];
  bool bEnd = false;
  bool bPodeEscolher = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () async {
            await click(0);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cores[0],
            ),
            height: 70,
            width: 70,
            child: Center(
              child: Text(
                widget.options[0],
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            click(1);
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cores[1],
            ),
            child: Center(
              child: Text(
                widget.options[1],
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            click(2);
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cores[2],
            ),
            child: Center(
              child: Text(
                widget.options[2],
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            click(3);
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cores[3],
            ),
            child: Center(
              child: Text(
                widget.options[3],
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future click(int opt) async {
    if (bPodeEscolher) {
      if (widget.controller.actualImage == widget.controller.listImage[9]) {
        bEnd = true;
      }

      await validaEscollha(opt);
      changeImage();
    }
  }

  void changeImage() {
    if (!bEnd) {
      setState(() {
        cores = [Colors.black, Colors.black, Colors.black, Colors.black];
        widget.controller.actualImage = widget.controller.listImage[++index];
        bPodeEscolher = true;
      });
    } else {
      Modular.to.pushNamed('/home/finish/${widget.controller.acertos}');
    }
  }

  Future<void> validaEscollha(int escolha) async {
    setState(() {
      bPodeEscolher = false;
      if (widget.options[escolha] ==
          widget.controller.actualImage.imageName
              .substring(0, 1)
              .toUpperCase()) {
        cores[escolha] = Colors.green;
        widget.controller.actualImage.correct = true;
        widget.controller.incrementAcertos();
        Helper.playSound(true);
      } else {
        Helper.playSound(false);
        cores[escolha] = Colors.red;
        widget.controller.actualImage.correct = false;
        widget.controller.incrementErros();
      }
    });

    await Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        // Here you can write your code for open new view
      });
    });
  }
}
