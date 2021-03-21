import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Helper {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static List<String> options(String correctOption) {
    List<String> local = ['', '', '', ''];
    var rnd = new Random();
    var correctIndex = rnd.nextInt(3);
    var actualLetter = '';
    local[correctIndex] = correctOption.toUpperCase();

    for (var i = 0; i <= 3; i++) {
      if (local[i] == '') {
        actualLetter = alphabet[rnd.nextInt(26)].toUpperCase();
        while (local.contains(actualLetter)) {
          actualLetter = alphabet[rnd.nextInt(26)].toUpperCase();
        }

        local[i] = actualLetter;
      }
    }

    return local;
  }

  static Future<void> playSound(bool success) async {
    await AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audios/${success ? 'sucess' : 'wrong'}.mp3"),
    );
  }

  static String getFinishSound(int level) {
    if (level < 4) {
      return 'assets/audios/low.mp3';
    } else if (level < 7) {
      return 'assets/audios/medium.mp3';
    } else if (level > 6) {
      return 'assets/audios/high.mp3';
    } else {
      return '';
    }
  }

  static Future<void> playFinishSound(int sound) async {
    await AssetsAudioPlayer.newPlayer().open(
      Audio(getFinishSound(sound)),
    );
  }
}
