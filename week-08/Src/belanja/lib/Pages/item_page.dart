import 'package:flutter/material.dart';
import 'package:belanja/Models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            item.name!,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            children: [
              Hero(tag: item.name!, child: Image.asset(item.fotoUrl!)),
              const SizedBox(
                height: 20,
              ),
              Text(
                item.name!,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rp. ${item.price.toString()}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
