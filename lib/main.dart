import 'package:duyuru/atawidget.dart'; //atawidged sınıfımızı içeri aktardık
import 'package:duyuru/duyuru.dart'; //duyuru sınıfımızı içeri aktardık
import 'package:duyuru/islemler.dart'; //duyuru sınıfımızı içeri aktardık
import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'anasayfa.dart'; //anasayfa sınıfımızı içeri aktardık
import 'dart:core';

void main() {
  runApp(AtaWidget(
      islem: Islemdetay(),
      child:
          Anagiris())); //uygulamanın başlangıcı olarak AtaWidget olarak tanımlayıp işlem olarak işlem detay ve alt sınıfını ana giriş olarak tanımladık
}

class Anagiris extends StatefulWidget {
  //ana girişi stateful olarak sınıflandırdık
  @override
  _AnagirisState createState() =>
      _AnagirisState(); //yeni bir anagiriş state  i oluşturduk
}

class _AnagirisState extends State<Anagiris> {
  //stati ana giriş olarak override ettikten sonra ayawidged in içersine verivar olup olmadığını kontrol ettirdik
  bool verivar = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AtaWidget.of(context).islem.istek().then((deger) {
      verivar =
          deger; //atawidgeti çalıştırdıktan sonra gelen veriyi veri varın içine atar
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //metarial App metarial kütüphanesinin nesnesidir ve metaryallerimizi tanımladığımız sınıftır
      theme: ThemeData(
          primaryColor: Color(0xFF464646),
          accentColor: Colors
              .indigo), //uygulamamızın başta çalıştırırken kodladığımız renktir
      home: verivar //home : anasayfa yani uygulamanın başında çalışacak dart dosyasını içinde gösterir
          ? anasayfa() //veri var ise ana sayfayı gösterir yok ise yüklemede dönen çemberi gösterir.
          : Center(
              child:
                  CircularProgressIndicator(), //veriler gelene kadar ekranda yüklenme imleci koyduk
            ),
      routes: rotalar, //aşağıda oluşturduğumuz rotaları yonlendiren kod
      debugShowCheckedModeBanner: false, //debug bannerını kaldırdık
    );
  }
}

var rotalar = <String, WidgetBuilder>{
  //ana sayfaya ve duyurulara rotalar oluşturduk
  "/anasayfa ": (BuildContext context) => anasayfa(),
  "/duyurular": (BuildContext context) => duyuru(),
};
