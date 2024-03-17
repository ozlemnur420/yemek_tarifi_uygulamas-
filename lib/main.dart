
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YEMEK TARİFİ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    var ekran_bilgisi=MediaQuery.of(context);
    final double ekran_yuksekligi=ekran_bilgisi.size.height;
    final double ekran_genisligi=ekran_bilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
           SizedBox(
               width: ekran_genisligi,
               child: Image.asset("resimler/yemekresim.jpeg")
           ),
           Row(
             children: [
               Expanded(
                 child: SizedBox(
                   height: ekran_genisligi/8,
                   child: TextButton(
                     child: Yazi("BEĞEN",ekran_genisligi/25),
                     onPressed:(){
                       print("Beğenildi");
                     },

                     style: TextButton.styleFrom(
                       backgroundColor: Colors.deepOrange,
                     ),
                   ),
                 ),
               ),
        
               Expanded(
                 child: SizedBox(
                   height: ekran_genisligi/8,
                   child: TextButton(
                 
                     child: Yazi("YORUM YAP",ekran_genisligi/25),
                     onPressed:(){
                       print("Yorum yapıldı");
                     },
                     style: TextButton.styleFrom(
                       backgroundColor: Colors.deepOrange,
                     ),
                   ),
                 ),
               ),
             ],
           ),
        
            Padding(
              padding: EdgeInsets.all(ekran_yuksekligi/100),
              child: Column( // Ana column dan farklı olarak bölgesel içerikleri
                // sola hizalamak için column kullandık
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KÖFTE",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: ekran_genisligi/20,
                    ),
                  ),
        
                  Row(
                    children: [
                      Yazi("Izgara Üzerinde Pişirmeye Uygun", ekran_genisligi/25),
                      Spacer(),
                      Yazi("15 Mart", ekran_genisligi/25), // özel text
                    ],
                  ),
                ],
              ),
            ),
        
            Padding(
              padding: EdgeInsets.all(ekran_yuksekligi/100),
              child: Yazi("Köfte harcını hazırlamak için, soğanları rendeleyin ve maydanozları ince ince kıyın. İsterseniz, bir diş sarımsak da ekleyebilirsiniz."
                  "Soğan, maydanoz, kıyma, yumurta, zeytinyağı ve tuzu bir kaba alıp iyice yoğurun. Bu sırada istediğiniz baharatları da ekleyerek yoğurmaya devam edin."
                  "Hazırladığınız harcın üzerini streç filmle kapatarak yarım saat buzdolabında dinlendirin."
                  "Ardından harçtan ceviz büyüklüğünde parçalar koparıp yuvarlayın. 1 cm olacak şekilde üzerine bastırarak yassılaştırın",ekran_genisligi/25),
            )
          ],
        ),
      ),
    );
  }
}
class Yazi extends StatelessWidget {
  String icerik;
  double yazi_boyut;

  Yazi(this.icerik, this.yazi_boyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik, style: TextStyle(fontSize:yazi_boyut),);
  }
}

