import 'package:flutter/material.dart';
import 'package:mediaplayer/index.dart';

// Main dart Dosyam. Yönlendirme yapılmak için kullanıldı.
// Bu proje 4 işlem becerisi geliştirme projesidir.

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false, // Debug etiketini gizleme komutu.
    home: index(), // Home kısmına diğer sayfamı yönlendirdim.
  )
  );
}