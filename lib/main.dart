import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commission',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Commission bi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/cover.jpg", height: 200, fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(radius: 75, backgroundColor: Colors.white,
                    child: myProfilePic(72),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Matar Yade",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                Spacer()
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text("Amougne xeuy mais YALLA baxna, mangi chiare sama mbokou chomeur yi, mangiléne di massawou bou bax",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            Divider(thickness: 2,),
            sectionTitleText("A propos de moi"),
            aboutRow(icon: Icons.house, text: "Koki, Louga, Sénégal"),
            aboutRow(icon: Icons.work, text: "Vendeur de pasteque (khaale)"),
            aboutRow(icon: Icons.favorite, text: "En couple avec gélou Mor bi"),
            Divider(thickness: 2,),
            sectionTitleText("Amis"),
            allFriends(width / 3.5),
            Divider(thickness: 2,),
            sectionTitleText("Mes Posts"),
            post(time: "5 minutes", image: "images/Matar.jpg", desc: "Petit tour au Magicgland, on s'est bien amusés et en plus il n'y avait pas grand monde. Bref, le kiff"),
            post(time: "2 jours", image: "images/mountain.jpg", desc: "Canada : La montagne ca vous gagne", likes: 38),
            post(time: "1 semaine", image: "images/work.jpg", desc: "Retour au boulot après plusieurs mois de confinement", likes: 12, comments: 3),
            post(time: "5 ans", image: "images/playa.jpg", desc: "Le boulot en plage c'est le pied: la preuve ceci sera mon bureau pour les prochaines semaines", likes: 235, comments: 188)
          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(radius: radius, backgroundImage: AssetImage("images/MatarYade.jpg"));
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
      ),
      child: (icon == null)
          ? Center(child: Text(text ?? "", style: TextStyle(color: Colors.white)))
          : Icon(icon, color: Colors.white,),
      height: 50,
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey)],
              color: Colors.blue

          ),

        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "Diallo Chomeur": "images/cat.jpg",
      "Mor Lekh": "images/sunflower.jpg",
      "Matar bou Lala": "images/duck.jpg"
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Container post({required String time , required String image, required String desc, int likes = 0, int comments = 0}) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Baye sama wadji"),
              Spacer(),
              timeText(time)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(image, fit: BoxFit.cover,)
          ),
          Text(desc,
            style: TextStyle(
                color: Colors.blueAccent),
            textAlign: TextAlign.center,

          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("$likes Likes"),
              Icon(Icons.message),
              Text("$comments Commentaires")
            ],
          )

        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text("Il y a $time", style: TextStyle(color: Colors.blue),);
  }
}
