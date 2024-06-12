import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'package:url_launcher/url_launcher.dart'; //hedef url linkini çalıştırabilmek için url kütüphanemizi import ettik

//duyuru dart dosyamızı import ettik
class yanmenu extends StatelessWidget {
  //yan menümüzü stateless widget olarak sınıflandırdık
  @override
  Widget build(BuildContext context) {
    //widgetimizi context olarak oluşturduk
    return Container(
      padding: EdgeInsets.only(top: 80.0),
      //yanda açılan menümüzü üstten 80 piksel boşluk verdik
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //baştan itibaren nesneleri yerleştirir
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.white10,
                /* teknoloji fakültesinin logosunun frond end 
                kısmı yani logomuzun arka planı beyaz 
                ve sağ-sol-üst-alt olmak üzere logoyu 
                çerçeve şeklinde boşluk bıraktık(pixsel olarak) */
                child: Image.asset('assets/tflogo.jpg')),
            Expanded(
              child: ListView(
                //menüleri liste olarak alt alta yerleştirmeyi sağlayan metoddur
                children: <Widget>[
                  ListTile(
                    //listile özelliği olarak menü butonu görevi görür
                    leading: Icon(Icons.domain), //butonun ikonu
                    title: Text('Bölüm Site Duyuruları'),
                    //butonun uygulamada gözüken ismi
                    onTap: () {
                      //butonun ontab özelliğindeki yapacak olduğu fonksiyon ve rota yönlenmesi
                      Navigator.pop(context);

                      //duyurulara yönlendiren rota
                    },
                  ),
                  Divider(
                    height: 5.0, //menülerin arasındaki boşluk 5piksel
                    color: Colors.blueAccent,
                  ),
                  ExpansionTile(
                    //expansiontile menüleri bir araya toplayarak grup oluşturan özelliktir
                    leading: Icon(Icons.person),
                    //iconumuzu belirledik
                    title: Text('Bölüm Personel Duyuruları'),
                    //grupladığımız menülerin başlığını attık
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Prof. Dr. İbrahim YÜCEDAĞ'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/ibrahimyucedag/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Doç. Dr. Ali ÇALHAN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/alicalhan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. Metin TOZ'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/metintoz/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. Serdar BİROĞUL'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/serdarbirogul/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. Ahmet ALBAYRAK'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/ahmetalbayrak/Profil/Duyurular');
                            //
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. M. Enes BAYRAKDAR'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/muhammedbayrakdar');
                            //
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. Bahar TERCAN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/bahartercan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Dr. Leyla TEKİN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/leylakuru/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Öğr. Gör. Dr. Fadime ÖĞÜLMÜŞ DEMİRCAN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/fadimedemircan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Dr. Hakan GÜNDÜZ'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/hakangunduz/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Ercan ATAGÜN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/ercanatagun/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Hacer BAYIROĞLU'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/hacerbayiroglu/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Sümeyye BAYRAKDAR'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/sumeyyebayrakdar/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Tuba KARAGÜL YILDIZ'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/tubakaragul/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        //soldan 15 piksellik boşluk attık
                        child: ListTile(
                          //listile özelliği olarak menü butonu görevi görür
                          leading: Icon(Icons.supervised_user_circle),
                          //personel ikonumuz
                          title: Text('Arş. Gör. Tunahan TİMUÇİN'),
                          //akademik personelimizin isminin başlığı
                          onTap: () {
                            //ontab ile link yönlendirmesini sağlayan fonksiyona linki gönderdik
                            Navigator.pop(context);
                            _linkac(
                                'http://akademik.duzce.edu.tr/tunahantimucin/Profil/Duyurular');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_linkac(String link, {https}) async {
  //_linkac fonksiyonu kullanıldığında çalışacak fonksiyon
  if (await canLaunch(link)) {
    //linkten cevap helene kadar bekler
    await launch(link);
    //gelen stringi link olarak açar
  } else {
    debugPrint('Link Açılmıyor!!!'); //linkten cevap gelmezse hata mesajı verir
  }
}
