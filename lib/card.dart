import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  _gerateList() {
    List<Widget> list = [];
    for (var i = 0; i < 1; i++) {
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

  // FLIP TO GO

  AnimationController flipToBackController;
  Animation<double> flipToBackAnimation;
  double flipToBack = 0.0;
  double flipToBackOpacity = 1.0;

  AnimationController flipToFrontController;
  Animation<double> flipToFrontAnimation;
  double flipToFront = 3.14 / 2;
  double flipToFrontOpacity = 0.0;

  // FLIP TO BACK

  AnimationController flipToFrontController2;
  Animation<double> flipToFrontAnimation2;

  AnimationController flipToBackController2;
  Animation<double> flipToBackAnimation2;

  @override
  void initState() {
    super.initState();

    // VIRAR FRONT DO CARD
    flipToBackController = new AnimationController(
        duration: const Duration(milliseconds: 280), vsync: this);
    flipToBackAnimation =
        Tween(begin: 0.0, end: -3.14 / 2).animate(flipToBackController)
          ..addListener(() {
            setState(() {
              flipToBack = flipToBackAnimation.value;
              if (flipToBackAnimation.isCompleted) {
                flipToBackOpacity = 0.0;
                flipToFrontOpacity = 1.0;
                flipToFrontController.forward();
              }
            });
          });

    // VIRAR BACK DO CARD
    flipToFrontController = new AnimationController(
        duration: const Duration(milliseconds: 280), vsync: this);
    flipToFrontAnimation =
        Tween(begin: 3.14 / 2, end: 0.0).animate(flipToFrontController)
          ..addListener(() {
            setState(() {
              flipToFront = flipToFrontAnimation.value;
            });
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                flipToBackController2.reset();
                flipToFrontController2.reset();
              });
            }
          });

    // VOLTAR CARD

    flipToFrontController2 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 280));
    flipToFrontAnimation2 =
        Tween(begin: 0.0, end: 3.14 / 2).animate(flipToFrontController2)
          ..addListener(() {
            setState(() {
              flipToFront = flipToFrontAnimation2.value;
              if (flipToFrontAnimation2.isCompleted) {
                flipToBackOpacity = 1.0;
                flipToFrontOpacity = 0.0;
                flipToBackController2.forward();
              }
            });
          });

    flipToBackController2 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 280));
    flipToBackAnimation2 =
        Tween(begin: -3.14 / 2, end: 0.0).animate(flipToBackController2)
          ..addListener(() {
            setState(() {
              flipToBack = flipToBackAnimation2.value;
//          if (flipToBackAnimation2.isCompleted) {
//            flipToBackOpacity = 0.0;
//          }
            });
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                flipToBackController.reset();
                flipToFrontController.reset();
              });
            }
          });

    // DRAG
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
      alignment: Alignment.center,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Stack(
          children: <Widget>[_Card(), _controls(), _cardButton()],
        ),
      ),
    );
  }

  Widget _Card() {
    return Stack(
      children: <Widget>[
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(flipToFront),
          alignment: Alignment.center,
          child: Opacity(
              opacity: flipToFrontOpacity,
              child: Card(
                elevation: 2.0,
                child: Container(
                  child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 8.0),
                              child: Text('BACK',
                                  style: TextStyle(fontSize: 32.0)),
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
              )),
        ),
        Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(flipToBack),
            alignment: Alignment.center,
            child: Opacity(
              opacity: flipToBackOpacity,
              child: Card(
                  elevation: 2.0,
                  child: Container(
                    child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 8.0),
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
                  )),
            )),
      ],
      fit: StackFit.expand,
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
    print('next()');
//    setState(() {
//      this.front = false;
//    });
    flipToBackController.forward();
  }

  _prev() {
    print('prev');
    flipToFrontController2.forward();
//    setState(() {
//      this.front = true;
//    });
  }
}
