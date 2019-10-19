import 'package:alcorgas/widgets/logo.widget.dart';
import 'package:alcorgas/widgets/submit-form.dart';
import 'package:alcorgas/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _completed = false;
  var _busy = false;
  var _resultText = 'Compensa útilizar Álcool';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          color: _color,
          duration: Duration(milliseconds: 1200),
          child: ListView(
            children: <Widget>[
              Logo(),
              SizedBox(
                height: 40,
              ),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                      busy: _busy,
                      submitFunc: calculate,
                    ),
            ],
          ),
        ));
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.purpleAccent;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(
      const Duration(seconds: 40),
      () => {
        setState(() {
          if (res >= 0.7) {
            _resultText = 'Compensa Utilizar Gasolina!';
          } else {
            _resultText = 'Compensa Utilizar Álcool!';
          }

          _busy = false;
          _completed = true;
        }),
      },
    );
  }

  reset() {
    setState(() {
      _color = Colors.purple;
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
