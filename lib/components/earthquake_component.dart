import 'package:all_earthquakes_app/models/earthquakes_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/data_model.dart';

class EarthquakeComponent extends StatelessWidget {
  final DataModel earthquake;

  EarthquakeComponent({super.key, required this.earthquake});

  @override
  Widget build(BuildContext context) {
    // Convert time from milliseconds to UTC format
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(earthquake.time!), isUtc: true);
    final String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    Color alertColor;
    final Uri url = Uri.parse(earthquake.url!);
    switch(earthquake.alert){
      case 'green':
        alertColor = Colors.green;
        break;
      case 'yellow':
        alertColor = Colors.yellow;
        break;
      case 'orange':
        alertColor = Colors.orange;
        break;
      case 'red':
        alertColor = Colors.red;
        break;
      default:
        alertColor = Colors.black12;
    }
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/earthquake.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  'Magnitude: ${earthquake.magnitude}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Location: ${earthquake.location}'),
              ),
            SizedBox(height: 10),
            Text(
              'Date: ${earthquake.date}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time (UTC): $formattedTime',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Tsunami Possibility: ${earthquake.tsunami}',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                const Text(
                  'Alert: ',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: alertColor,
                  ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch ${earthquake.url}';
                }
              },
              child: Text('More Info'),
            ),
          ],
        ),
      ),
    );
  }
}
/*Image.network(
                  'https://example.com/earthquake_image.png', // Replace with a valid image URL
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )*/