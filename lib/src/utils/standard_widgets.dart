import 'package:flutter/material.dart';

class Standard {
  static Widget getBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).disabledColor.withAlpha(30)),
    );

    final circle_2 = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).backgroundColor.withAlpha(25)),
    );

    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/back.jfif"),
                  repeat: ImageRepeat.repeat),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ])),
        ),
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, left: -30.0, child: circle),
        Positioned(top: 100.0, right: 150.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle_2),
        Positioned(bottom: 120.0, right: 20.0, child: circle_2),
        Positioned(bottom: -50.0, left: -20.0, child: circle_2)
      ],
    );
  }

  static AppBar appBar(BuildContext context, Widget title) {
    return AppBar(title: title);
  }

  static Widget titleToForm(
      BuildContext context, String title, TextAlign position) {
    Color _color = Theme.of(context).cardColor;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.apply(
              color: _color,
            ),
        textAlign: position,
      ),
    );
  }

  static ButtonStyle buttonStandardStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        elevation: 5.0,
        shadowColor: Theme.of(context).dividerColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20));
  }

  static String getFisioImage(String type) {
    return type
        .replaceAll("Fisioterapia ", "")
        .replaceAll("á", "a")
        .replaceAll("é", "e")
        .replaceAll("í", "i")
        .replaceAll("ó", "o")
        .replaceAll("ú", "u");
  }

  static Widget getBoard(BuildContext context, String message, IconData icon) {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Card(
            margin: EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icon, size: 100.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                icon == Icons.download
                    ? Container(
                        margin: EdgeInsets.all(14.0),
                        height: 35.0,
                        width: 35.0,
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              ],
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static String GetTerapyState(int state) {
    switch (state) {
      case 1:
        return "Realizada";
      case 2:
        return "Cancelada";
      default:
        return "Programada";
    }
  }

  static Widget getInfoLine(
      BuildContext context, String title, String subtitle) {
    return ListTile(
      
      title: Text(title, style: Theme.of(context).textTheme.bodyText2),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.headline6),
    );
  }
}
