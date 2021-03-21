import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MediumWidget extends StatelessWidget {
  final int acertos;
  const MediumWidget({
    Key key,
    this.acertos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Você foi bem!',
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 60,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Você acertou $acertos ${acertos == 1 ? 'pergunta' : 'perguntas'}',
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset('assets/images/happy.png'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          child: GestureDetector(
            child: Image.asset('assets/images/retry.png'),
            onTap: () => Modular.to.popAndPushNamed('/'),
          ),
        ),
        Text(
          'Jogar novamente',
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
