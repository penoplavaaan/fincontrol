
import 'package:fincontrol/Models/card_model.dart';
import 'package:fincontrol/Services/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fincontrol/Companents/flutter_text_field_fab.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'package:fincontrol/Models/model.dart';

class MainScreen extends StatefulWidget {

  MainScreen({ Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int dohod_value  = 0;
  int rashod_value = 0;

  int curr_minus = 0;
  int curr_plus = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: doSomeQuery(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //return Text('The answer to everything is ${snapshot.data}');
        if (snapshot.hasData) {
          return Text('The answer to everything is ${snapshot.data}');
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  TextFieldFloatingActionButton(
                    'Внести доход...',
                    CupertinoIcons.plus,
                    onChange: (String query) => ({curr_plus = int.parse(query)}),
                    onClear: () => (setState(() {
                      dohod_value += curr_plus;
                    })),
                    iconColor: CupertinoColors.black,
                    backgroundColor: Colors.white,
                    onSubmit: (value) {},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Внесите свои расходы и доходы \n Текущий доход: ' + dohod_value.toString() + ' руб.\nТекущий расход: ' + rashod_value.toString() + ' руб.'),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(padding: EdgeInsets.only(right: 20)),
                  TextFieldFloatingActionButton(
                    'Внести расход...',
                    CupertinoIcons.minus,
                    onChange: (String query) => ({curr_minus = int.parse(query)}),
                    onClear: () => (setState(() {
                      rashod_value += curr_minus;
                    })),
                    iconColor: CupertinoColors.black,
                    backgroundColor: Colors.white,
                    onSubmit: (String query) {
                      print(query);
                    },

                  )
                ],
              ),
            ],
          );
        }
      },
    );

  }

  Future doSomeQuery() async {
    print("222");
    Cards card = Cards(id: 1, content: "adc",additionalInfo: "drr");
    print("333");
    await DB.insert('cards', card);
    print("4");
    var result =  await DB.query('cards');
    print('yes');
    result.forEach((row) => print(row));

  }


}


