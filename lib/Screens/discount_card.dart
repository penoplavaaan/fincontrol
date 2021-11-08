import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget discount_cards_screen(context) {
  return SizedBox(
    height: 400,
    width: 300,
    child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Карта №1'),
              Text('Лента',),
            ],
          ),
        ),
        back: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Text('Покажите QR-код на кассе'),
              Text('Количество баллов: 18',),
              QrImage(
                data: 'https://livebook72.ru/test',
                version: QrVersions.auto,
                size: 200,
                gapless: false,
              )
            ],
          ),
        ),
    ),
  );
}