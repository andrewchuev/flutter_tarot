import 'package:flutter/material.dart';
import 'package:tarot/tcard.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailScreen extends StatefulWidget {
  final TCard tcard;

  DetailScreen({Key key, @required this.tcard}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedIndex = 0;
  double _fontSize = 18.0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 1:
          {
            _fontSize += 1.0;
          }
          break;
        case 2:
          {
            _fontSize -= 1.0;
          }
          break;
        default:
          {
            print("Invalid choice");
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tcard.title),
      ),
      body: ListView(
        children: <Widget>[
          //_widgetOptions.elementAt(_selectedIndex),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/" + widget.tcard.image + ".jpg", height: 300),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.tcard.desc.replaceAll('-:', "\n-:")),
          ),
          Html(
            data: widget.tcard.fullDesc != null ? widget.tcard.fullDesc : '',
            defaultTextStyle: TextStyle(fontSize: _fontSize),
            padding: EdgeInsets.all(8.0),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Font+'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_circle),
            title: Text('Font-'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
