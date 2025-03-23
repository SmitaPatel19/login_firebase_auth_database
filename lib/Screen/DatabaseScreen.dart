import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase_new/functions/databaseFunctions.dart';
import 'package:login_firebase_new/pages/pets.dart';

class DatabaseOptions extends StatefulWidget {
  const DatabaseOptions({super.key});

  @override
  State<DatabaseOptions> createState() => _DatabaseOptionsState();
}

class _DatabaseOptionsState extends State<DatabaseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Options'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // To provide this data we can use textfield to get the data from user then pass to the functions.
                  create('pets', 'kitty', 'jerry', 'cat', 5);
                },
                child: Text('Add Data'),
              ),

              ElevatedButton(
                onPressed: () {
                  update('pets', 'tom', 'age', 15);
                },
                child: Text('Update Data'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PetsList()),
                  );
                },
                child: Text('View Data'),
              ),

              ElevatedButton(
                onPressed: () {
                  delete('pets', 'kitty');
                },
                child: Text('Delete Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
