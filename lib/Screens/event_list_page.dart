import 'package:flutter/material.dart';
import '../models/event.dart';
import 'event_detail_page.dart';

class EventListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width > 800 ? 32.0 : 16.0;
    // double fontSize = MediaQuery.of(context).size.width > 800 ? 24.0 : 18.0;
    // double appBarFontSize =
    //     MediaQuery.of(context).size.width > 800 ? 20.0 : 18.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: TextStyle(
            color: Colors.deepPurple,
            fontStyle: FontStyle.italic,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListView.builder(
          itemCount: mockEvents.length,
          itemBuilder: (context, index) {
            final event = mockEvents[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  title: Text(
                    event.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${event.date}\n${event.description}',
                      style: TextStyle(height: 1.5), // Improved readability
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(event: event),
                        ),
                      );
                    },
                    child: Text('RSVP'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
