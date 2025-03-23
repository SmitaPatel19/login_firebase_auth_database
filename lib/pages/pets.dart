import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//Page to retrieve info
//We have to listen the database
//Each document is called as Snapshot

class PetsList extends StatefulWidget {
  const PetsList({super.key});

  @override
  State<PetsList> createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Pets List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('pets').snapshots(),
            builder: (context, petSnapshot) {
              if (petSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                final pets = petSnapshot.data!.docs;
                return ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(pets[index]['name']),
                        subtitle: Text(pets[index]['animal']),
                        trailing: Text(pets[index]['age'].toString()),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
