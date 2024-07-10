import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_football_app/data_source.dart';
import 'package:flutter_football_app/pages/page_detail.dart';

class ItemTeam extends StatelessWidget {
  ItemTeam({
    Key? key,
  }) : super(key: key);

  final DataSource dataSource = DataSource();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      DataSource.allData.length,
      (index) {
        final data = DataSource.allData[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetailWidget(id: data['id'])));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(data['imagePath'], width: 100, height: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['name'].toString()),
                          Text(data['founded'].toString()),
                        ]),
                  )
                ],
              ),
            ));
      },
    ));
  }
}
