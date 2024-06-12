import 'package:flutter_html/flutter_html.dart';
/* flutter_html kütüphanemizi içeri aktardık 
bu kütüphane html işlemleri kolylaştırmak ve html kodlarının tagları olmadan body kısmını
 parselleyerek hedef urldeki html kodlarını çeker */
import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'package:duyuru/yanmenu.dart'; //tasarladığımız yanmenümüzü göstermek için import ettik
import 'package:http/http.dart'
    as http; //http kütüphanemizi http olarak kullanabilmemiz için kalıtım alıp http olarak tanımladık
import 'package:url_launcher/url_launcher.dart'; //hedef url linkini çalıştırabilmek için url kütüphanemizi import ettik

class duyuru extends StatefulWidget {
  @override
  _duyuruState createState() => _duyuruState();
}

class _duyuruState extends State<duyuru> {
  String _htmlveri = '';
  @override
  initState() {
    //initstate metodu istediğimiz fonksiyonu anasayfa açıldığı anda çalıstırmak için kullandığımız bir metoddur.
    super.initState();
    _istek(); //init statet metodu ile istek fonksiyonumuzu kullandık
  }

  Future _istek() async {
    //istek fonksiyonumuz sonradan çalışacağı için future olarak tanımladık.

    _htmlveri =
        ''; //_htmlveri2 değişlenimizin içini boş tanımladık null dönmesin diye

    setState(() {}); //yulardaki init state metodu burada çalışmaya başladı.

    await http.get('http://bm.tf.duzce.edu.tr/tum-duyurular').then((gelenveri) {
      //hedef url adresinden cevaplar gelene kadar beklettik
      _htmlveri = gelenveri
              .body //urlden gelen html verilerinin body kısmını değişkenimizin içine attık
              .replaceAll('  ', '') //string düzenlemeleri: iki boşlukları siler
              .replaceAll('\n',
                  '') //string düzenlemeleri: altsatıra geçmilen düzensiz boşlukları siler
              .replaceAll('\t', '') //string düzenlemeleri: tabları siler
              .replaceRange(0, 13757,
                  '') //string düzenlemeleri yapıldıktan sonra değişkenimizin içindeki işimize yaramayan verileri sildik
              .replaceRange(6900, 7000,
                  '') //string düzenlemeleri yapıldıktan sonra değişkenimizin içindeki işimize yaramayan verileri sildik
          ;
      debugPrint(gelenveri
          .toString()); //gelen veriyi stringe dönüştürüp konsola yazdırdık (test amaçlı)

      setState(() {}); //initstate fonksiyonunu kapattık
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold nesnesi tanımladık
      appBar: AppBar(
        //scaffold nesnesının bir nesnesi olan app bar tanımladık

        title: Text("duyuru"), //başlığı duyuru yaptık
        actions: <Widget>[
          //Bir başlık, eylemler ve bir taşma açılır menüsü olan tipik bir AppBar nesnesidir

          IconButton(
            //widget in içerisindeki yenile butonudur

            icon: Icon(Icons.refresh), //ikonu yenileme ikonu olduğunu belirttik
            onPressed:
                _istek, //butona tıklandığında istek fonksiyonunu çalıştırdık
          )
        ],
      ),
      body: Center(
        child:
            _htmlveri.length > 0 //_htmlveri değişkenimizin içi boşmu diye bakar
                ? SingleChildScrollView(
                    //boş değilse child nesnesinin içinde çektiğimiz html verilerini gösterir

                    child: Html(data: _htmlveri, onLinkTap: _linkac(
                        //test amaçlı duyuru linki açtırdık
                        "http://bm.tf.duzce.edu.tr/Duyuru/29579/yaz-okulu-sinavlari-hk_")),
                  )
                : CircularProgressIndicator(),
        //eğer değişkenimizin içiboş ise veri gelene kadar ekranın ortasında dönen imleçbelirir
      ),
    );
  }
}

_linkac(String link, {http}) async {
  //_linkac fonksiyonu kullanıldığında çalışacak fonksiyon
  if (await canLaunch(link)) {
    //linkten cevap helene kadar bekler
    await launch(link);
    //gelen stringi link olarak açar
  } else {
    debugPrint('Link Açılmıyor!!!');
    //linkten cevap gelmezse hata mesajı verir
  }
}
