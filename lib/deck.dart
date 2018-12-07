import 'package:flutter/material.dart';
import './components/drawer.dart';

class DeckPage extends StatefulWidget {
  @override
  _DeckPageState createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Baralhos'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
            title: Text('Programação Orientada a Objetos'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Banco de dados'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Inglês'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Programação Web'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Engenharia de software III'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Programação Orientada a Objetos'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Banco de dados'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Inglês'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Programação Web'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Engenharia de software III'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
