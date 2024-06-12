import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'islemler.dart'; //islemler dosyamızı kullanabilmemiz için import ettik

class AtaWidget extends InheritedWidget {
  //inherit widget
  final Islemler islem; //islemler adında final değişleni atadık
  AtaWidget(
      {Key key,
      @required Widget child,
      this.islem}) //atawidget sınıfımızın constructure blogu
      : super(key: key, child: child);
  static AtaWidget of(BuildContext context) {
    //atawidgeti heryerde kullanbilmek için kalıtım aldık
    // ignore: deprecated_member_use
    return context.inheritFromWidgetOfExactType(AtaWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>
      true; //kalıtım aldığımız atawidgeti override ettik
}
