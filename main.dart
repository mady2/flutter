import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_fne/Homepage.dart';
import 'package:projet_fne/backend/classdeatient.dart';
import 'package:projet_fne/backend/classmedicament.dart';
import 'package:projet_fne/frontend/gestiondesmedicament/listesdesmedicament.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test(),
    );
  }
}


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('List des medicament '),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page1(),
                    ));
              },
            ),
            RaisedButton(
              child: Text('liste des patients'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => houda()));
              },
            ),
            RaisedButton(
              child: Text('Page 3'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List des medicament '),
      ),
      body: ListView.builder(
        itemCount: listdesmedicament.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Medicament c = listdesmedicament[index];
          return ListTile(
            title: Text('${c.nommedicament}'),
            subtitle: Text('${c.dose}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ajouter_Medicament(),
            ));
      }),
    );
  }
}

TextEditingController nommedicamnt = new TextEditingController();

TextEditingController dose1 = new TextEditingController();

class Ajouter_Medicament extends StatefulWidget {
  @override
  _Ajouter_MedicamentState createState() => _Ajouter_MedicamentState();
}

class _Ajouter_MedicamentState extends State<Ajouter_Medicament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Column(
          children: [
            TextFormField(
              controller: nommedicamnt,
              decoration: InputDecoration(labelText: 'nom medicament'),
            ),
            TextFormField(
              controller: dose1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'dose medicament'),
            ),
            RaisedButton.icon(
                onPressed: () {
                  ajout(nommedicamnt.text, double.parse(dose1.text));
                },
                icon: Icon(Icons.save),
                label: Text('Save'))
          ],
        ),
      ),
    );
  }
}

void ajout(String nommed, double dose) {
  Medicament medicament = new Medicament(dose: dose, nommedicament: nommed);
  listdesmedicament.add(medicament);
}

class houda extends StatefulWidget {
  @override
  _houdaState createState() => _houdaState();
}

class _houdaState extends State<houda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("list des pasions"),
        ),
        body: ListView.builder(
          itemCount: listedespatient.length,
          itemBuilder: (context, index) {
            Patient mahdi = listedespatient[index];
            return ListTile(
              title: Text("${mahdi.nompatient}"),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ajouter(),
                ));
          },
        ));
  }
}

class ajouter extends StatefulWidget {
  @override
  _ajouterState createState() => _ajouterState();
}

class _ajouterState extends State<ajouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ajouter un petion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextFormField(
              controller: nom_de_patient,
              decoration: InputDecoration(labelText: "nom de patient"),
            ),
            TextFormField(
              controller: buillon_de_patient,
              decoration: InputDecoration(labelText: "buillon de patient"),
            ),
            TextFormField(
              controller: dose,
              decoration: InputDecoration(labelText: "dose"),
            ),
            RaisedButton(
              child: Text("save"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

TextEditingController nom_de_patient = new TextEditingController();
TextEditingController buillon_de_patient = new TextEditingController();
TextEditingController dose = new TextEditingController();
