import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function func;
  var text = '';

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            margin: EdgeInsets.only(bottom: 50),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50)),
            child: FlatButton(
              child: Text(text,
                  style: TextStyle(
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor,
                    fontFamily: "Big Shoulders Display",
                    fontSize: 25,
                  )),
              onPressed: func,
            ),
          );
  }
}
