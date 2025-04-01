import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'previsoes_screen.dart';
import 'mmarcadoras_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Previsão de Resultados'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PredictionScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Melhores Marcadoras'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopScorersScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}