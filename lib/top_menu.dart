import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/screen/settings.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Меню',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(color: Colors.green, image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/top-menu-cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выход'),
            onTap: () => {SystemChannels.platform.invokeMethod('SystemNavigator.pop')},
          ),
        ],
      ),
    );
  }
}
