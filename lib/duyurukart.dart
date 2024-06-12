import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'package:flutter_html/flutter_html.dart';
/* flutter_html kütüphanemizi içeri aktardık 
bu kütüphane html işlemleri kolylaştırmak ve html kodlarının tagları olmadan body kısmını
 parselleyerek hedef urldeki html kodlarını çeker */
import 'package:url_launcher/url_launcher.dart'; //url_launcher kütüphanemizi içeri aktardık gerekirse hedef url i açmamızı sağlar

class DuyuruKart extends StatelessWidget {
  /* DuyuruKart isminde sınıf oluşturduk bu sınıf ana sayfadaki containerı
 tasarımı ve verileri kendi içinde çekilen veri nekadar ise 
 okadar listedeki verileri kutu içerisinde gösterir */
  final duyurular;
  //duyurular isminde final yani sonradan oluşacak bir değişken tanımladık.
  final linkler;
  //duyurular isminde final yani sonradan oluşacak bir değişken tanımladık.

  const DuyuruKart(
      {Key key, this.duyurular, this.linkler, GestureDetector child})
      : super(key: key);
//duyurular ve linkler değişkeni için constructure(yapıcı) sınıfını tanımladık

  @override //geçerli widget in içersine oveeride ettik
  Widget build(BuildContext context) {
    //gelecek verileri widget oluşturması için
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        _linkac("http://bm.tf.duzce.edu.tr/Duyuru/$linkler");
      },
      child: Container(

          //gelen verileri container içinde anasayfaya geri döndürdük

          margin: EdgeInsets.all(
              10.0), //oluşturulan widged ımızın içindeki container nesnesinin kenarlarını anasayfadan 10 piksel uzaklaştırdık
          color: Colors.blueAccent, //konteynırımızın iç rengini tanımladık
          child: Container(
            //tekrar konteynırımızın içinde bir konteyner daha açtık
            height: 110.0, //yüksekliğini 110 piksek tanımladık
            color: Colors.white, //arkaplan rengimizi beyaz yaptık
            margin: EdgeInsets.fromLTRB(3.0, 25.0, 3.0, 10.0),
            /*konteynerımızındış çizgilerini sırasıyla sol=3px
            -üst=10px-sağ=3px-alt=10px olarak biçimlendirdik*/
            child: Center(
              child: Html(
                data:
                    duyurular, //data olarak html kütüphanesini kullanarak konteynırın ortasında çektiğimiz duyuruları görüntüle dedik
              ),
            ),
          )),
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
