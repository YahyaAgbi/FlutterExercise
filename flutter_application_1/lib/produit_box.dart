import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  Function(BuildContext context)? delProduit;
  ProduitBox({
    super.key,
    required this.nomProduit,
    this.selProduit = false,
    this.onChanged,
    this.delProduit,
  });
  String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: delProduit,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(45),
        ),
        height: 120,
        child: Row(
          children: [
            Checkbox(value: selProduit, onChanged: onChanged),
            Text(nomProduit),
          ],
        ),
      ),
    );
  }
}
