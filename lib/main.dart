import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'tcard.dart';
import 'database_helper.dart';
import 'detail_screen.dart';
import 'card_template_small_icons.dart';
import 'top_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: CardList(), debugShowCheckedModeBanner: false));
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Справочник таролога'),
        ),
        body: ListView(
          children: <Widget>[
            CardGroup(sql: 'SELECT * FROM tcards WHERE groupId is null order by orderNo'),
            CardGroup(sql: 'SELECT * FROM tcards WHERE groupId = "g" order by orderNo ASC'),
            CardGroup(sql: 'SELECT * FROM tcards WHERE groupId = "k" order by orderNo ASC'),
            CardGroup(sql: 'SELECT * FROM tcards WHERE groupId = "m" order by orderNo ASC'),
            CardGroup(sql: 'SELECT * FROM tcards WHERE groupId = "p" order by orderNo ASC'),
          ],
        ));
  }
}

class CardGroup extends StatelessWidget {
  final String sql;

  CardGroup({Key key, @required this.sql}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      height: 160,
      child: FutureBuilder<List>(
          future: rawQuery(this.sql),
          initialData: List(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: cardTemplate(snapshot.data[i]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    tcard: TCard.fromMapObject(snapshot.data[i]),
                                  )));
                    },
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Future<List> rawQuery(String sql) async {
  Database db = await DatabaseHelper.instance.database;
  List<Map> result = await db.rawQuery(sql);
  return result;
}
