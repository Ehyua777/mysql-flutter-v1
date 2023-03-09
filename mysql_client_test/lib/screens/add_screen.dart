import 'package:flutter/material.dart';
import '../models/db_factory.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un utilisateur"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Nom et prenom")),
            controller: name,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Email")),
            controller: email,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Mot de passe")),
            controller: pw,
          ),
          ElevatedButton(
            onPressed: () async {
              final conn = await DBFactory().mySQLConnectionMethod();

              await conn.connect();

              var res = await conn.execute(
                "INSERT INTO users (name, email, pw) VALUES (:name, :email, :pw)",
                {
                  "name": name.text,
                  "email": email.text,
                  "pw": pw.text,
                },
              );

              print(res.affectedRows);
              await conn.close();
              Navigator.pop(context);
            },
            child: Text("Enregister"),
          )
        ],
      ),
    );
  }
}
