import 'dart:convert';

import 'package:http/http.dart' as http;


class AnnouncementService {
  final String apiUrl;

  AnnouncementService({required this.apiUrl});

  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http.get(Uri.parse(apiUrl));
  
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<Announcement>.from(list.map((model) => Announcement.fromJson(model)));
    } else {
      throw Exception('Failed to load announcements');
    }
  }
}

class Announcement {
  final String title;
  final String body;
  final String image;

  Announcement({required this.title, required this.body, required this.image});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['title'],
      body: json['body'],
      image: json['photoUrl']
    );
  }
}
