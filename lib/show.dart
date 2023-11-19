import 'package:flutter/material.dart';
import 'package:pushnotification/announcementsDetails.dart';
import 'package:pushnotification/list.dart';

class AnnouncementList extends StatelessWidget {
  final AnnouncementService announcementService = AnnouncementService(apiUrl: 'https://10.0.2.2:7170/api/Products');

  AnnouncementList({super.key}){
    announcementService.fetchAnnouncements();
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Duyurular'),
        ),
        body: FutureBuilder<List<Announcement>>(
          future: announcementService.fetchAnnouncements(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    final duyuru = snapshot.data![index];
    final kisaltilmisBaslik = duyuru.title.length > 30 ? '${duyuru.title.substring(0, 30)}...' : duyuru.title;
    final kisaltilmisAciklama = duyuru.body.length > 100 ? '${duyuru.body.substring(0, 100)}...' : duyuru.body;

    return Card(
      child: ListTile(
        title: Text(kisaltilmisBaslik),
        subtitle: Text(kisaltilmisAciklama),
        leading: Image.network(duyuru.image),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DuyuruDetay(duyuru: duyuru),
            ),
          );
        },
      ),
    );
  },
);
            }
          },
        ),
      ),
    );
  }
}
