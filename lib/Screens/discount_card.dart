import 'package:fincontrol/Models/card_model.dart';
import 'package:fincontrol/Services/db.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fincontrol/ContentFillers/discount_card_content_filler.dart';
import 'package:sqflite/sqflite.dart';

Widget discount_cards_screen(context) {
  return FutureBuilder(
    future: queryDiscountCards(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if(snapshot.hasData){
        print(snapshot.data.runtimeType);
        List<Widget> cards = [];
        snapshot.data.forEach((discountCard){
          cards.add(const Padding(padding: EdgeInsets.only(top: 30)));
          cards.add(SizedBox(
            height: 400,
            width: 300,
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              speed: 500,
              onFlipDone: (status) {

              },
              front: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(discountCard['sideOneAdditionalInfo']),
                    Text(discountCard['sideOneName']),
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
                    Text(discountCard['sideTwoAdditionalInfo']),
                    QrImage(
                      data: discountCard['sideTwoData'],
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                    )
                  ],
                ),
              ),
            ),
          ));

        });
        return  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards,
          ),
        );
      };
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator()
        ],
      );
    }
  );
}

Future queryDiscountCards() async{
  Database db = await openDatabase(await getDatabasesPath()+DiscountCardContentFiller.dbName);
  await db.execute(DiscountCardContentFiller.onCreateString);
  DB dbCardManipulator = DB(db, DiscountCardContentFiller.dbName, DiscountCardContentFiller.tableName, DiscountCardContentFiller.onCreateString);

  for (DiscountCard discountCard in DiscountCardContentFiller.discountCards) {
    dbCardManipulator.insert(discountCard);
  }


  return dbCardManipulator.queryAll();
}