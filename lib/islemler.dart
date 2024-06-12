import 'modeller.dart';
//modeller kütüphanesini import ettik
import 'package:http/http.dart' as http;
//http kütüphanemizi http olarak kullanabilmemiz için kalıtım alıp http olarak tanımladık

abstract class Islemler {
  //islemler isminde özet sınıf tanımladık bu sınıf bütün işlemleri vefonksiyonları program açıldığızaman çalıştırır fakat uygulamamızda mvc yi aktif hale getiremedik.
  List<Duyurumodeli> duyurular;
  //duyurular isminde liste ve duyuru modeli nesnesi olarak tanımladık
  Future<bool> istek();
  //istek fonksiyonumuzu true false olarak döndürmek amaçlı ikili değişken olarak tanımladık
  String veriler;
  //veriler isminde string değişken tanımladık
}

class Islemdetay implements Islemler {
  @override
  List<Duyurumodeli> duyurular = List();
  //listemizin içini boş olarak değer atadık

  @override
  String veriler;
  //veriler isminde string değişken tanımladık

  @override
  Future<bool> istek() async {
    veriler = '';
    //veriler değişlenimizin içini boş tanımladık null dönmesin diye
    await http.get('http://bm.tf.duzce.edu.tr/tum-duyurular').then(
      (gelenveri) {
        //hedef url adresinden cevaplar gelene kadar beklettik
        veriler = gelenveri.body
            //urlden gelen html verilerinin body kısmını değişkenimizin içine attık
            .replaceAll('  ', '')
            //string düzenlemeleri: iki boşlukları siler
            .replaceAll('\n', '')
            //string düzenlemeleri: altsatıra geçmilen düzensiz boşlukları siler
            .replaceAll('\t', '')
            //string düzenlemeleri: tab boşluklarını  siler
            .replaceRange(0, 16000, '')
            //string düzenlemeleri yapıldıktan sonra değişkenimizin içindeki işimize yaramayan verileri sildik
            .replaceRange(4000, 5000, '');
        //string düzenlemeleri yapıldıktan sonra değişkenimizin içindeki işimize yaramayan verileri sildik
        RegExp duyurularibul = new RegExp('<p>(.*?)"</p>');
        // çektiğmiz html verilerinin içinde  regexp metodu ile p taglarını arattırdık duyurularibul adlı değişkene aktardık
        Iterable<RegExpMatch> eslestir = duyurularibul.allMatches(
          //çektiğimiz p taglarının arasındaki stringleri liste şeklinde daha kolay bir yöntem olan iterable tanımladık
          veriler, //ve tüm eşleşen p taglarını veriler değişkenimiz içinde arattık
        );
        for (Match m in eslestir) {
          //for döngüsü içinde eşleşen verileri veriler değişkenimize grupladık
          veriler = m.group(1);
          print(veriler);
          //test amaçlı çekilen verileri konsol ekranında yazdırdık
        }
      },
    );

    return true;
    //sınıfımızı boşdönmemesi için tru döndürdük
  }
}
