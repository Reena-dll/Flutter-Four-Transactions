import 'package:flutter/material.dart';
import 'dart:math';
import 'index.dart';
class Cikarma extends StatefulWidget {
  @override
  _CikarmaState createState() => _CikarmaState();
}

int sayi1 = Random().nextInt(99)+1;
int sayi2 = Random().nextInt(99)+1;


class _CikarmaState extends State<Cikarma> {
  Text textControl(String cumle, Color yazirenk) {

    return Text('$cumle',style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: yazirenk,
    ),);
  }
  void _showAlert (String text) {

    AlertDialog dialog = new AlertDialog(
      title: Text('$text'),
      content: Text('Devam Etmek İster Misiniz ?'),
      actions: <Widget>[
        new FlatButton(
            child: Text('Evet'),
            onPressed: (){
              Navigator.of(context).pop();
            }
        ),
        new FlatButton(
            child: Text('Hayır'),
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  index()));
            }
        )
      ],
    );

    showDialog(context: context, child: dialog);
  }
  String _text='';
  void onPressed(){
    print('Değişkene değer atandı = $_text');

    String toplam = (sayi1-sayi2).toString();
    print(toplam);


    setState(() {
      if(toplam==_text) {
        print('İFE GİRDİ');
        _showAlert('Cevabınız Doğru Devam Etmek İster Misiniz ?');
      }
      else if (toplam!=_text)
      {
        _showAlert('Cevabınız Yanlış Devam Etmek İster Misiniz ?');
      }

      sayi1 = Random().nextInt(99)+1;
      sayi2 = Random().nextInt(99)+1;

    });
  }

  void onChanged(String deger)
  {
    setState(() {
      _text = deger;
    });
  }
  var _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0x1FFFFFFF),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: textControl('Çıkarma İşlemi',Colors.white)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textControl('Çıkarma Menüsüne Hoş Geldiniz.', Colors.white),
                  textControl('Soruları Cevaplayıp Derecenizi ', Colors.white),
                  textControl('Öğrenebilirsiniz.', Colors.white),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                onChanged: (String deger){onChanged(deger);},
                controller: _controller,
                maxLines: 1,
                autocorrect: true,
                maxLength: 6,
                decoration: InputDecoration(
                  icon: Icon(Icons.forward),
                  hintText: 'Cevabınızı Girin',
                  suffixIcon: IconButton(
                    onPressed: ()=> _controller.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  labelText: '$sayi1 - $sayi2',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              RaisedButton(
                child: textControl('Gönder', Colors.black),
                onPressed: (){onPressed();},

              )
            ],
          ),
        ),
      ),
    );
  }
}
