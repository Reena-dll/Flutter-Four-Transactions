import 'package:flutter/material.dart';
import 'index.dart'; // Bir önceki sayfamız. Oraya yönlendirme yapacağımız için import etmemiz gerekiyor.
import 'dart:math'; // Random komutunu kullanabilmek için math kütüphanesini import etmemiz gerekli.

class Bolme extends StatefulWidget {
  @override
  _BolmeState createState() => _BolmeState();
}

// Toplama sayfası ve burada kullanıcıya random gelecek olan toplama işlemlerini yapacak.


int sayi1 = Random().nextInt(99)+1; // Random komutuyla 1 ile 100 arasında bir sayı oluşturuyorum. Bu sayıyı alt kısımlarda bölme işleminde kullanacağım.
int sayi2= Random().nextInt(99)+1; // Bu iki sayıyı kullanıcıya gösterip böldürmek isteyeceğim ve vereceğe cevaba göre doğru veya yanlış olacak.



class _BolmeState extends State<Bolme> {
  Text textControl(String cumle, Color yazirenk) { // TEXT CLASS'I bir önce ki sayfada anlatmıştım.

    return Text('$cumle',style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold, // Yazı stilleri
      fontStyle: FontStyle.italic,
      color: yazirenk,
    ),);
  }
  void _showAlert (String text) { // ALERT DİALOG'MUZ. Kullanıcı doğru veya yanlış bildiğinde ekrana gelecek dialog widgetimiz.

    AlertDialog dialog = new AlertDialog( // AlertDialog clasından dialog adında bir nesne türettim.
      title: Text('$text'), // Başlık kısmı parametreden gelecek.
      content: Text('Devam Etmek İster Misiniz ?'), // Başlığın alt bilgi kısmında devam etmek ister misiniz sorusunu soruyorum. Kullanıcı evet veya hayır cevabı verecek.
      // Hayır derse index sayfasına, evet derse yine aynı sayfada kalacak. Soruları çözmeye devam edecek.
      actions: <Widget>[
        new FlatButton( // Evet buttonu.
            child: Text('Evet'),
            onPressed: (){
              Navigator.of(context).pop(); // Basıldığı taktirde bir önceki duruma gelme komutu.
            }
        ),
        new FlatButton( // Hayır butonu
            child: Text('Hayır'),
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  index())); // Basıldığı taktirde index sayfasına yönlendirilecek ve başka bir seçim yapacak.
            }
        )
      ],
    );

    showDialog(context: context, child: dialog); // Eğer bunu kullanmaz isek dialog'umuz açılmaz.
  }
  String _text=''; // _text adında string değişken oluşturdum.
  void onPressed(){ // Aşağıda ki Raised buton için açılmış bir onPressed sınıfı.
    print('Değişkene değer atandı = $_text'); // Butona tıklandığı taktirde konsola _text değerini yazdırıyor. Bu değer de kullanıcının TextField'e girdiği değer.
    String toplam = (sayi1/sayi2).toString(); // Bu kısımda, yukarıda oluşturduğumuz sayi1 ve sayi2'yi bölüyorum ve string toplam değişkenine atıyorum.
    print(toplam); // konsola toplamı yazdırıyorum.
    setState(() {
      _text= _text+'.0'; // Burada bunu yapmamın sebebi, Toplam değişkeni string olduğu için iki sayının bölümünden kalan sayı 2.0'lı geliyor ve kullanıcının _Text'e girdiği değer 2 olduğundan dolayı
      // Asla aşağıda ki if bloğuna giriş olmuyor. Yani kullanıcı 2 cevabını da verse double değişkenden stringe attığımızdan dolayı veriyi 2.0 olması gerekiyor cevabın. Bu yüzdenben de burada
      // Kullanıcının verdiği cevaba +.0 eklemesi yaparak string değişkeni sanki double gibi gösterdim.
      if(toplam==_text) { // Bu sorgumuzda kullanıcının verdiği cevap doğru mu sorgusudur. _Text kullanıcının cevabı, 'toplam' ise sorunun cevabı. Eğer eşitse soru doğrudur. İF Bloğuna girer.
        print('İFE GİRDİ'); // Konsol bilgi
        _showAlert('Cevabınız Doğru Devam Etmek İster Misiniz ?'); // Yukarıda oluşturduğum _showAlert diyalogunu kullanarak ekrana bilgi çerçevesi yolladım. Parametresini de doğru olarak yazdım.
      }
      else if (toplam!=_text) // Burası da kullanıcı cevabı yanlış bildiği durumda oluşacak durum.
      {
        _showAlert('Cevabınız Yanlış Devam Etmek İster Misiniz ?'); // Parametresine cevabın yanlış olduğunu belirtiyorum.
      }


      sayi2 = Random().nextInt(99)+1; // Bu kısım önemli. Burada her buttona bastığımda en yukarıda random oluşturduğum değerleri değiştiriyorum. Her butona basıldığında sorunun değişmesi
      // gerektiğinden dolayı sayi2 ye tekrar bir random değer ataması yapıyorum.
      for (int i = 1; i <= sayi2; i++)    {
        // Bu kısımda ise şöyle bir mantık kurdum. Sayi2'nin bölünenlerine bakıyorum. Hangi sayılara bölünüyor ise cevap ondalık sayı çıkmasın diye
        // sayi1'imi ona göre belirliyorum. Yani mantık şu= Random değerler aldığımızda 67e 90 falan gelebilir. Bu 2 sayıyı bölemeyiz, yani bölebiliriz fakat ondalık sayı çıkar.
        // Bu yüzden random olarak gelecek sayi2'nin bölenlerine baktım ve bir kaç sayının olduğunu gördüm.

        if(sayi2 % i == 0) // Sayi2 mod 0 ise
        {
          // Burada yukarıda bahsettiğim gibi, yeni bir random değer oluşturdum ve i'yi onunla çarptım. Yani yaptığım açıkçası şudur ki:
          // i değeri bizim bölen sayımız. 11'e kadar sayı üretebilecek bir random oluşturup bunu i ile çarpttım. Zaten i burada ilk gelecek değer 1 olacağından dolayı, her hangi 11e kadar olan
          // sayıyla çarpttığımda artık ikinci sayım hep bölünebilen bir sayı geliyor hem de farklı sayılar geliyor.
          // Kısacası burada kurduğum mantık, i ilk değer de 1 geldiğinden dolayı onu oluşturduğum random değerle çarpıp diğer bölenlerine ulaştım.
          int random =Random().nextInt(11)+1; // Random değerim
          sayi1 = i*random; // Sayi1 değerim.
        }
      }

    });
  }

  void onChanged(String deger) // TextField'in onChanged sınıfı
  {
    setState(() { // Burada kullanıcı textfield'e her hangi bir şey girdiğinde direkt oluşturduğumuz _text değişkeninin içine giriyor.
      // Böylelikle yukarıda sorunun doğru mu yanlış mı olduğunu anlıyoruz.
      _text = deger; // Değer ataması.
    });
  }
  var _controller = TextEditingController(); // Bu TextField'de kullandığım çarpı butonu için Edit classı. Çarpıya basınca textField'de ki bütün veriyi siliyor.


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug etiket kaldırma komutu.
      home: Scaffold(
        backgroundColor: Color(0x1FFFFFFF), // background renk ayarı
        appBar: AppBar( // AppBar
            backgroundColor: Colors.black, // AppBar background renk
            centerTitle: true, // Background text ortalama
            title: textControl('Bölme İşlemi',Colors.white) // Yukarıda ki classtan kullandığım Text'im.
        ),
        body: Center( // Kolonu body de ortaladım.
          child: Column( // Kolon açtım
            mainAxisAlignment: MainAxisAlignment.center, // Kolon içeriğini ortaladım.
            children: <Widget>[
              Column(  // Kolon içerisinde yazılarımı yazmak için tekrardan bir kolon açtım
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textControl('Bölme Menüsüne Hoş Geldiniz.', Colors.white),
                  textControl('Soruları Cevaplayıp Derecenizi ', Colors.white), // classtan text oluşturdum.
                  textControl('Öğrenebilirsiniz.', Colors.white),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0), // Yazıyla textfield arasına 20 piksel boşluk attım.
              ),
              TextField( // TextField, Kullanıcının veri gireceği yer.
                cursorColor: Colors.white, // İmleç, yanıp sönen çubuğun rengi :)
                style: TextStyle( // yazı stili.
                  fontSize: 20.0, // 20 büyüklük
                  color: Colors.white, // beyaz yazı
                ),
                onChanged: (String deger){onChanged(deger);}, // Yukarıda oluşturduğum classı kullandım ve parametrelerini girdim.
                controller: _controller, // Bu çarpıya basınca yazıları silen controller.
                maxLines: 1, // TextField maksimum satır.
                autocorrect: true, // Otomatik düzeltme aktif. Klavyelerin otomatik düzenlemelerini aktif hale getirdik.
                maxLength: 6, // Maksimum karakter sayısı. Zaten 4 işlem olduğundan 6 haneliden fazla bir sonuç çıkmayacak.
                decoration: InputDecoration( // TextField dekarasyon kısmı.
                  icon: Icon(Icons.forward), // Kenardan ok iconu çıkarttım.
                  hintText: 'Cevabınızı Girin', // Text içerisine Cevabınızı girin ön bilgilendirme mesajı verdim.
                  suffixIcon: IconButton( // Bu da çarpı butonumuz.
                    onPressed: ()=> _controller.clear(), // Çarpı butonumuza controllerini verdik ve clear metodu ile text'i sildirdik.
                    icon: Icon(Icons.clear),// Bu da butonun iconu.
                  ),
                  labelText: '$sayi1 ÷ $sayi2', // Bu bizim sorularımızın çıktığı kısım. Random gelen sayi2 ve bölüneni gelen sayi1. Yukarıda sürekli değişen sayılarımız. Kullanıcı burada görüyor. Aralarına bölme işlemi koydum. Kullanıcı ne yapacağını bilsin diye.
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0), // Buton ile textfield arasına 20 piksel
              ),
              RaisedButton(
                child: textControl('Gönder', Colors.black), // Raised button ayarı
                onPressed: (){onPressed();}, // Yukarıda ki classtan çekiyor her şeyi. Yani bu sayı arttırma hesaplama yapma işlemleri falan hep bunun içerisinde.

              )
            ],
          ),
        ),
      ),
    );
  }
}
