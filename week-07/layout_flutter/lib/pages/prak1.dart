import 'package:flutter/material.dart';

class LayoutNav extends StatelessWidget {
  const LayoutNav({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/rakum2.jpg',
                width: 360,
              ),
            ),
          ],
        ),
      );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text(
                    'Wisata Air Terjun Coban Rondo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Turen, Jawa Timur, Indonesia',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          /* soal 3*/
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        InkWell(
            onTap: () => Navigator.of(context).pushNamed('/hal1'),
            child: _buildButtonColumn(color, Icons.near_me, 'ROUTE')),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Air terjun Coban Rondo memiliki ketinggian yang mencapai 84 meter. Dengan debit air yang deras saat musim hujan maupun musim kemarau, air terjun ini memang sangat indah.',
        // softWrap: true,
        // maxLines: 3,
        // overflow: TextOverflow.ellipsis,
      ),
    );

    return Scaffold(
      body: ListView(
        children: [
          header(),
          const SizedBox(height: 10),
          titleSection,
          const SizedBox(height: 30),
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
