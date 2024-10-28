import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_produit.dart';
import 'package:flutter_application_1/produit_box.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  final nomController = TextEditingController();
  List liste = [
    ["1 Produit", false],
    ["2 Produit", true],
    ["3 Produit", false],
    ["4 Produit", false],
    ["5 Produit", false],
  ];

  void onChanged(bool? value, int index) {
    setState(() {
      liste[index][1] = value;
    });
  }

  void SaveProduits() {
    setState(() {
      liste.add([nomController.text, false]);
      nomController.clear();
      Navigator.of(context).pop();
    });
  }

  void addProduit() {
    showDialog(
        context: context,
        builder: (context) {
          return AddProduit(
            nomController: nomController,
            onAdd: SaveProduits,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  void delProduit(int index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: liste[index][0],
            selProduit: liste[index][1],
            onChanged: (value) => onChanged(value, index),
            delProduit: (context) => delProduit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduit,
        child: const Icon(Icons.add),
      ),
    );
  }
}
