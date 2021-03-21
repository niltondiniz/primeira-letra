import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeira_letra/app/shared/utils/helper.dart';
import 'package:primeira_letra/app/shared/widgets/word_options.dart';
import 'home_controller.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Primeira Letra"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller.initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        /*leading: GestureDetector(
          onTap: () {
            Modular.to.pushNamed("home/finish/${controller.acertos}");
          },
          child: Icon(Icons.menu),
        ),*/
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (controller.actualImage == null) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: FAProgressBar(
                              currentValue: controller.listImage.length,
                              size: 50,
                              maxValue: 10,
                              changeColorValue: 100,
                              changeProgressColor: Colors.pink,
                              backgroundColor: Colors.white,
                              progressColor: Colors.lightBlue,
                              animatedDuration:
                                  const Duration(milliseconds: 300),
                              direction: Axis.horizontal,
                              verticalDirection: VerticalDirection.up,
                              displayText: '%',
                              displayTextStyle: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Aguarde carregando as imagens...',
                          style: TextStyle(
                            fontFamily: 'LuckiestGuy',
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Acertos: ',
                              style: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${controller.acertos.toString()}/10',
                              style: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Erros: ',
                              style: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${controller.erros.toString()}/10',
                              style: TextStyle(
                                fontFamily: 'LuckiestGuy',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: CachedNetworkImage(
                      imageUrl: controller.actualImage.previewURL,
                    )
                    /*Image.network(
                    controller.actualImage.previewURL,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FAProgressBar(
                            currentValue: ((loadingProgress
                                            .cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes) *
                                    100)
                                .toInt(),
                            size: 50,
                            maxValue: 100,
                            changeColorValue: 100,
                            backgroundColor: Colors.white,
                            progressColor: Colors.lightBlue,
                            animatedDuration: const Duration(milliseconds: 300),
                            direction: Axis.horizontal,
                            verticalDirection: VerticalDirection.up,
                            displayText: '%',
                            displayTextStyle: TextStyle(
                              fontFamily: 'LuckiestGuy',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                    fit: BoxFit.contain,
                  ),*/
                    ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: WordOptions(
                        controller: controller,
                        options: controller.actualImage.options,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
