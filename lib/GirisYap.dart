import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Anasayfa.dart';
import 'SifreYenile.dart';
import 'UyeOl.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);
  @override
  Girisyap createState() => Girisyap();
}

class Girisyap extends State<GirisYap > {
  String uyead= ''; String sifre = '';

  void kontrolet() {
    if ((uyead.length >= 3) && (sifre.length >= 3)) {
      var veri = [];
      veri.add(uyead); veri.add(sifre);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => AnaSayfa(), settings: RouteSettings(arguments: veri,),));
    }
  }
  void uyeadKaydet(String text) {
    setState(() {
      uyead = text;
    });
  }
  void sifreKaydet(String text) {
    setState(() {
      sifre = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool butondurum = true;
    if ((uyead.length >= 3) && (sifre.length >= 3)) {
      butondurum = false; }
    else{ butondurum = true; }

    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 40.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Container(
          height: 600.0, width: 600.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
            child: Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                child: Column(children: <Widget>[
                  SizedBox(height: 120.0),
                 const Text("Giriş Yapmak İster Misin?",
                     style: TextStyle(
                         color: Colors.black87,
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.normal,
                         shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4 ) ]
                     )
                ),
              SizedBox(height: 100.0),

              TextFormField(
                onChanged: (text) {
                  uyeadKaydet(text);  },
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),),
                      labelText: "Üye Ad",
                      labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0), )),
                ),
                SizedBox(height: 30.0),

                TextFormField(
                  onChanged: (text) {
                    sifreKaydet(text); },
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),),
                      labelText: "Şifre",
                      labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
                SizedBox(height: 30.0),

               ButtonBar(
                 alignment: MainAxisAlignment.center,
                 buttonPadding:const EdgeInsets.symmetric(
                     horizontal: 30,
                     vertical: 10,
                 ),
                 children: <Widget>[
                   SizedBox(height: 28.0),
                   Container(
                     child: FloatingActionButton(
                    child: Icon(Icons.add_task),
                    tooltip: "Giriş Yapmak İster Misin?",
                    backgroundColor: Colors.white,
                     foregroundColor: Colors.green,
                       onPressed: butondurum ? null : kontrolet,
                   ),
                   ),
                     Container(
                    child:  FloatingActionButton(
                      child: Icon(Icons.admin_panel_settings),
                      tooltip: "Şifreni Mi Unuttun?",
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.red,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Sifreyenile(),),
                        ); },
                     ),
                   ),
                   Container(
                     child: FloatingActionButton(
                       child: Icon(Icons.attribution),
                       tooltip: "Üye Olmak İster Misin?",
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.blue,
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => Uyeol(),),
                         ); },
                     ),
                   ),
                  ],
                   ),
                 ],
               ),
           ),
      ),
      ),
    );
  }
}