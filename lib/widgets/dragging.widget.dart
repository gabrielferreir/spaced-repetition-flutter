import 'package:flutter/material.dart';
import '../screens/card/card.state.dart';

class Dragging extends StatefulWidget {
  Widget child;

  Dragging({Widget child}) {
    this.child = child;
  }

  @override
  _DraggingState createState() => _DraggingState(child: child);
}

class _DraggingState extends State<Dragging> with TickerProviderStateMixin {
  Widget child;

  _DraggingState({Widget child}) {
    this.child = child;
  }

  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideBackStart;
  AnimationController slideBackAnimation;

  Tween<Offset> slideOutTween;
  AnimationController slideOutAnimation;

  @override
  void initState() {
    super.initState();

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

    slideOutAnimation = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 480))
      ..addListener(() {
        setState(() {
          cardOffset = slideOutTween.evaluate(slideOutAnimation);
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideOutTween = null;
            dragPosition = null;
            cardOffset = const Offset(0.0, 0.0);
          });
        }
      });
  }

  @override
  void dispose() {
    slideBackAnimation.dispose();
    super.dispose();
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
    final dragVector = cardOffset / cardOffset.distance;
    final right = context.size.width * 0.6;
    final left = context.size.width * -0.6;

    if (cardOffset.dx > right) {
      slideOutTween = new Tween(begin: cardOffset, end: dragVector * (2 * context.size.width));
      slideOutAnimation.forward(from: 0.0);
      print('Arrastou pra direita');

    } else if (cardOffset.dx < left) {
      slideOutTween = new Tween(begin: cardOffset, end: dragVector * (2 * context.size.width));
      slideOutAnimation.forward(from: 0.0);
      print('Arrastou pra esquerda');
    } else {
      slideBackStart = cardOffset;
      slideBackAnimation.forward(from: 0.0);
    }

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
            child: child));
  }
}

