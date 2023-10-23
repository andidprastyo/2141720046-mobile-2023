import 'package:flutter/material.dart';
import 'package:belanja/Pages/item_page.dart';
import 'package:belanja/Models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item>? items;

  @override
  void initState() {
    // TODO: implement initState
    //  Item({this.name, this.price, this.image, this.stok, this.rating});
    items = [
      Item(name: 'ATmega328', price: 10000, fotoUrl: 'Assets/ATmega328.jpeg', stock: 10, rating: '4.5'),
      Item(name: 'ESP32', price: 20000, fotoUrl: 'Assets/ESP32.jpeg', stock: 15, rating: '4.7'),
      Item(name: 'ESP8266', price: 15000, fotoUrl: 'Assets/ESP8266.jpeg', stock: 20, rating: '4.8'),
      Item(name: 'Jetson Xavier', price: 25000, fotoUrl: 'Assets/Jetson Xavier.jpeg', stock: 25, rating: '4.9'),
      Item(name: 'Jetson Nano', price: 30000, fotoUrl: 'Assets/Jetson Nano.jpeg', stock: 30, rating: '4.7'),
      Item(name: 'STM32 - Blue Pill', price: 35000, fotoUrl: 'Assets/STM32 - Blue Pill.jpeg', stock: 35, rating: '4.6'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Learning Flutter',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: GridView.count(
            padding: const EdgeInsets.all(8),
            crossAxisCount: 2,
            children: List.generate(items!.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemPage(item: items![index])));
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: Hero(
                            tag: items![index].name!,
                            child: Image.asset(
                              items![index].fotoUrl!,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        items![index].name!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Text("Stock : ${items![index].stock.toString()}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                          Text(items![index].rating!),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
