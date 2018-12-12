import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  _gerateList() {
    List<Widget> list = [];
    for (var i = 0; i < 3; i++) {
      list.add(MemoryCard(
        index: i,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Card 0001'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Container(
          margin: EdgeInsets.all(16.0),
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: _gerateList(),
          ),
        ),
      ),
    );
  }
}

class MemoryCard extends StatefulWidget {
  int index;

  MemoryCard({int this.index}) {
    this.index = index;
  }

  @override
  _MemoryCardState createState() => _MemoryCardState(index: index);
}

class ItemCard {
  String title;
  String description;

  ItemCard({this.title, this.description});
}

class _MemoryCardState extends State<MemoryCard> with TickerProviderStateMixin {
  List<ItemCard> cards = [];
  bool front = true;
  num index;

  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideBackStart;
  AnimationController slideBackAnimation;

//  Tween<Offset>

  @override
  void initState() {
    super.initState();
    slideBackAnimation = new AnimationController(
        duration: const Duration(milliseconds: 480), vsync: this)
      ..addListener(() => setState(() {
            cardOffset = Offset.lerp(
              slideBackStart,
              const Offset(0.0, 0.0),
              Curves.decelerate.transform(slideBackAnimation.value),
            );
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideBackStart = null;
            dragPosition = Offset(0.00, 0.0);
          });
        }
      });
  }

  @override
  void dispose() {
    slideBackAnimation.dispose();
    super.dispose();
  }

  _MemoryCardState({int index}) {
    this.index = index;
    var a = ItemCard(title: 'Pazuzu 01', description: 'Description 01');
    var b = ItemCard(title: 'Pazuzu 02', description: 'Description 02');
    var c = ItemCard(title: 'Pazuzu 03', description: 'Description 03');
    var d = ItemCard(title: 'Pazuzu 04', description: 'Description 04');

    this.cards.add(a);
    this.cards.add(b);
    this.cards.add(c);
    this.cards.add(d);
  }

  void _onPanStart(DragStartDetails details) {
    this.dragStart = details.globalPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final right = context.size.width * 0.6;
    final left = context.size.width * -0.6;
    if (cardOffset.dx > right) {
      print('Arrastou pra direita');
    } else if (cardOffset.dx < left) {
      print('Arrastou pra esquerda');
    }

    slideBackStart = cardOffset;
    slideBackAnimation.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Stack(
          children: <Widget>[
            front ? _frontCard() : _backCard(),
            _controls(),
            _cardButton()
          ],
        ),
      ),
    );
  }

  Widget _frontCard() {
    return Card(
        elevation: 8.0,
        color: Colors.green,
        child: Container(
          child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                      child: Text(this.cards[this.index].title,
                          style: TextStyle(fontSize: 32.0)),
                    ),
                    Text(
                      this.cards[this.index].description,
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              )),
          constraints: BoxConstraints.expand(),
        ));
  }

  Widget _backCard() {
    return Card(
      elevation: 8.0,
      child: Container(
        child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                    child: Text('BACK', style: TextStyle(fontSize: 32.0)),
                  ),
                  Text(
                    'BACK',
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            )),
        constraints: BoxConstraints.expand(),
      ),
    );
  }

  Widget _cardButton() {
    return Positioned(
      child: IconButton(
          icon: Icon(Icons.info, size: 36.0),
          onPressed: () {
            setState(() {
              if (this.front) {
                this.front = false;
              } else {
                if (this.index < 3) {
                  this.index = this.index + 1;
                } else {
                  this.index = 0;
                }
                this.front = true;
              }
            });
          }),
      bottom: 16.0,
      right: 16.0,
    );
  }

  Widget _controls() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _prev,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        GestureDetector(
          onTap: _next,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }

  _next() {
    setState(() {
      this.front = false;
    });
  }

  _prev() {
    setState(() {
      this.front = true;
    });
  }
}
