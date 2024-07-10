import 'package:flutter/material.dart';
import 'package:flutter_football_app/data_source.dart';

class TeamDetailWidget extends StatefulWidget {
  final int id;
  final DataSource dataSource = DataSource();
  TeamDetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  _TeamDetailWidgetState createState() => _TeamDetailWidgetState();
}

class _TeamDetailWidgetState extends State<TeamDetailWidget> {
  late String name;
  late int founded;
  String country = '';
  String venue = '';
  String? imagePath;

  @override
  void initState() {
    final data = widget.dataSource.getDetailTeam(widget.id);
    if (data != null) {
      name = data['name'];
      founded = data['founded'];
      country = data['country'];
      venue = data['venue'];
      imagePath = data['imagePath'];
    } else {
      name = 'Not Found';
      founded = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Detail Team',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                      imagePath ?? "https://via.placeholder.com/150"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: $name',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Founded: $founded',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text('Country: $country',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Venue: $venue',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
