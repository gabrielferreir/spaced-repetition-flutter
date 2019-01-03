import 'package:flutter/material.dart';
import 'package:tg/ui/common/drawer.widget.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import 'package:tg/ui/pages/card/card.page.dart';

class DeckPage extends StatefulWidget {
  @override
  _DeckPageState createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 4.0,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.settings, color: Colors.white),
                ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Baralhos'),
        automaticallyImplyLeading: false,
      ),
      drawer: DrawerWidget(),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
            title: Text('Programação Orientada a Objetos'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Banco de dados'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Inglês'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Programação Web'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Engenharia de software III'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Programação Orientada a Objetos'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Banco de dados'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Inglês'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Programação Web'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
          ListTile(
            title: Text('Engenharia de software III'),
            subtitle: Text('Ultimo acesso: 07/12/2018'),
            onTap: () {
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
        ],
      ),
    );
  }
}
