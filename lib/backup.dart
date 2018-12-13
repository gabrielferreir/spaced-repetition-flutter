  Widget _frontCard() {
    return Transform(
      transform: Matrix4.rotationY(flipToBack),
      alignment: Alignment.center,
      child: Card(
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
    );
  }

  Widget _backCard() {
    return Transform(
      alignment: Alignment.center,
      child: Card(
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
      ),
    );
  }