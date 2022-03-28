import 'package:flutter/material.dart';
import 'package:mediaplayer/bolme.dart';
// Diğer sayfaya geçiş için kullandığım importlar!!!!
import 'package:mediaplayer/carpma.dart';
import 'package:mediaplayer/cikarma.dart';
import 'package:mediaplayer/toplama.dart';


// Burası bizim giriş sayfamız ve kullanıcı burada seçim yapacak. Yapacağa seçime göre sayfalara yönlendirilecek.


class index extends StatefulWidget {
  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> {
  Text textControl(String cumle, Color yazirenk) {// Alt tarafta çok fazla text kullandığım için kod fazlalığından kaçınmak adına class'ını açtım.

    return Text('$cumle',style: TextStyle( // classtan aldığımız parametreyi text kısmında kullanıyoruz.
      fontSize: 20.0, // Yazı boyutu
      fontWeight: FontWeight.bold, // Yazı kalınlığı
      fontStyle: FontStyle.italic, // Yani stili
      color: yazirenk, // Yazının rengi. Bu da parametre ile doldurulacak.
    ),);
  }
  Expanded butonKontrol (String ifade) { // Birden fazla button olduğundan dolayı class'ını açtım ve bir tane parametresi bulunmakta.
   return Expanded(
      child: FlatButton(
        onPressed: (){
          setState(() { // Tıklandığında ne olacağı kısım -  EVENT
            print('$ifade tiklandi');

            if(ifade=='+')
              {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  Toplama()));
                // Eğer + Butonuna tıklandıysa Toplama sayfasına yönlendiren kod.
              }
            else if (ifade=='-')
              {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  Cikarma()));
                // Eğer - Butonuna tıklandıysa Toplama sayfasına yönlendiren kod.
              }
            else if (ifade=='x')
            {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  Carpma()));
              // Eğer x Butonuna tıklandıysa Toplama sayfasına yönlendiren kod.
            }
            else if (ifade=='÷')
            {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  Bolme()));
              // Eğer ÷ Butonuna tıklandıysa Toplama sayfasına yönlendiren kod.
            }
          });
        },
        child: Container( // Container içerisine bir adet circleavatar attım.
            child:  CircleAvatar(
                radius: 30.0, // Büyüklüğünü radius'unu 30 yaptım.
                child:  Text('$ifade', style: TextStyle( //Text tarafında yine parametre kullandım. Buttonların üstüne gelecek yazıyı belirleyen parametre.
                    fontSize: 55.0 //  Yazı büyüklüğünü 55 yaptım.
                ),),
                foregroundColor: Colors.white, // Circleavatarın yazı rengi beyaz
                backgroundColor: Colors.greenAccent // Arka plan renk ayarı - Circleavatar
            ),
            width: 77.0, // Container width
            height: 77.0, // Container height
            padding: const EdgeInsets.all(2.0), // Border width özelliği. Kenarlık!
            decoration: new BoxDecoration(
              color: const Color(0xFFFFFFFF), // border color özelliği. Kenarlık rengi
              shape: BoxShape.circle, // Container'ın şekli. Daire.
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug etiketi kapatma komudu.
      home: Scaffold(
        backgroundColor: Color(0x1FFFFFFF), // Arka plan rengi
        appBar: AppBar( // Başlık atmak için AppBar kullandım.
            backgroundColor: Colors.black,  // AppBar arka plan rengi
            centerTitle: true, // Appbar yazı ortalama komutu
            title: textControl('DÖRT İŞLEM',Colors.white)// AppBar da başlık atarken yukarıda oluşturduğum classtan yardım aldım.
        ),
        body: Center(// Kolonu body kısmında ortaladım.
          child: Column( // Kolon oluşturdum
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Kolonun widgetlerinin arasına eşit boşluk attım.
            children: <Widget>[
              Column( // Wdigetlerde yeni bir kolon açtım
                children: <Widget>[
                  Image.asset('images/giris.png', width: 200.0, height: 200.0), // Giriş resmimi yerleştirip boyutunu ayarladım.
                  Padding( // Padding kullanarak aşağıda ki yazı ile fotoğraf arasına boşluk attım.
                    padding: EdgeInsets.only(top: 45.0),
                  ),
                  textControl('Dört İşleme Hoş Geldiniz',Colors.white),// Yukarıda hazırladığım classtan yardım alarak Yazı yazdırdım.
                  textControl('Dört İşlem Becerinizi Geliştirmek İçin',Colors.white), // Parametrelerini doldurdum.
                  textControl('Doğru Yerdesiniz', Colors.white),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),//  Yine aynı şekilde boşluk bıraktım. Yukarıdan 15 piksel.
                  ),
                  textControl('Hangisiyle Devam Etmek İstersiniz ?', Colors.white) // Classtan yardım alarak text özelliğini kullandım.
                ],
              ),
              Row( // Kolonun içinde bir satır açarak buttonları yan yana sıraladım.
                mainAxisAlignment: MainAxisAlignment.center, // Satırın içerisini ortaladım
                children: <Widget>[
                  butonKontrol('+'), // Yukarıda oluşturduğum butonkontrol classını çağırarak butonlarımı oluşturdum.
                  butonKontrol('-'), // Parametrenin içerisine girdiğim değer butonun üstünde yazacak yazı olacak.
                  butonKontrol('x'), // Girmiş olduğum değere göre sayfa yönlendirmesi de yapılacak.
                 butonKontrol('÷'), // Hangisine basılırsa o sayfa yönlendirilecek.
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

